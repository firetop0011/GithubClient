//
//  ZLIssueInfoController.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2021/3/16.
//  Copyright © 2021 ZM. All rights reserved.
//

import UIKit
import FloatingPanel
import ZLBaseUI

class ZLIssueInfoController: ZLBaseViewController {

    // input model
    @objc var login: String?
    @objc var repoName: String?
    @objc var number: Int = 0

    var after: String?

    // view
    private lazy var itemListView: ZLGithubItemListView = {
        let itemListView = ZLGithubItemListView()
        itemListView.setTableViewHeader()
        itemListView.setTableViewFooter()
        itemListView.delegate = self
        return itemListView
    }()
    
    // subviewcontroller
    private lazy var floatingVC: FloatingPanelController = {
       
        let vc = FloatingPanelController()
        vc.layout = ZLIssueFloatingPanelLayout()
        vc.delegate = self
        
        let contentVC = ZLEditIssueController()
        contentVC.loginName = login
        contentVC.repoName = repoName
        contentVC.number = number
        vc.set(contentViewController: contentVC)
        vc.track(scrollView: contentVC.editIssueView.tableView)
        
        return vc 
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        itemListView.beginRefresh()
    }
    
    
    func setupUI() {
        
        self.title = ZLLocalizedString(string: "Issue", comment: "")

        self.zlNavigationBar.backButton.isHidden = false
        let button = UIButton.init(type: .custom)
        button.setAttributedTitle(NSAttributedString(string: ZLIconFont.More.rawValue,
                                                     attributes: [.font: UIFont.zlIconFont(withSize: 30),
                                                                  .foregroundColor: UIColor.label(withName: "ICON_Common")]),
                                  for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 60, height: 60)
        button.addTarget(self, action: #selector(onMoreButtonClick(button:)), for: .touchUpInside)

        self.zlNavigationBar.rightButton = button

        // view
        self.contentView.addSubview(itemListView)
        itemListView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-80)
        }
        
        floatingVC.addPanel(toParent: self)
        
    }
    

    @objc func onMoreButtonClick(button: UIButton) {

        let path = "https://www.github.com/\(login?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")/\(repoName?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")/issues/\(number)"

        guard let url = URL(string: path) else { return }

        button.showShareMenu(title: path, url: url, sourceViewController: self)

    }

}

extension ZLIssueInfoController {
    override func getEvent(_ event: Any?, fromSubViewModel subViewModel: ZLBaseViewModel) {
        if let cellData = subViewModel as? ZLGithubItemTableViewCellData {
            self.itemListView.reloadVisibleCells(cellDatas: [cellData])
        }
    }
}

extension ZLIssueInfoController: ZLGithubItemListViewDelegate {

    func githubItemListViewRefreshDragDown(pullRequestListView: ZLGithubItemListView) {

        guard let login = self.login, let repoName = self.repoName else {
            self.itemListView.endRefreshWithError()
            return
        }

        ZLServiceManager.sharedInstance.eventServiceModel?.getRepositoryIssueInfo(withLoginName: login,
                                                                                 repoName: repoName,
                                                                                 number: Int32(number),
                                                                                 after: nil,
                                                                                 serialNumber: NSString.generateSerialNumber()) { [weak self](resultModel: ZLOperationResultModel) in

            if resultModel.result == false {
                if let errorModel = resultModel.data as? ZLGithubRequestErrorModel {
                    ZLToastView.showMessage(errorModel.message)
                }
                self?.itemListView.endRefreshWithError()
            } else {
                if let data = resultModel.data as? IssueInfoQuery.Data {

                    self?.title = data.repository?.issue?.title
                    self?.after = data.repository?.issue?.timelineItems.pageInfo.endCursor

                    let cellDatas: [ZLGithubItemTableViewCellData] = ZLIssueTableViewCellData.getCellDatasWithIssueModel(data: data, firstPage: true)

                    self?.addSubViewModels(cellDatas)
                    self?.itemListView.resetCellDatas(cellDatas: cellDatas)

                } else {
                    self?.itemListView.endRefreshWithError()
                }
            }
        }
    }

    func githubItemListViewRefreshDragUp(pullRequestListView: ZLGithubItemListView) {

        guard let login = self.login, let repoName = self.repoName else {
            self.itemListView.endRefreshWithError()
            return
        }

        ZLServiceManager.sharedInstance.eventServiceModel?.getRepositoryIssueInfo(withLoginName: login,
                                                                                 repoName: repoName,
                                                                                 number: Int32(number),
                                                                                 after: after,
                                                                                 serialNumber: NSString.generateSerialNumber()) { [weak self](resultModel: ZLOperationResultModel) in

            if resultModel.result == false {
                if let errorModel = resultModel.data as? ZLGithubRequestErrorModel {
                    ZLToastView.showMessage(errorModel.message)
                }
                self?.itemListView.endRefreshWithError()
            } else {
                if let data = resultModel.data as? IssueInfoQuery.Data {

                    self?.title = data.repository?.issue?.title
                    self?.after = data.repository?.issue?.timelineItems.pageInfo.endCursor

                    let cellDatas: [ZLGithubItemTableViewCellData] = ZLIssueTableViewCellData.getCellDatasWithIssueModel(data: data, firstPage: false)

                    self?.addSubViewModels(cellDatas)
                    self?.itemListView.appendCellDatas(cellDatas: cellDatas)

                } else {
                    self?.itemListView.endRefreshWithError()
                }
            }
        }

    }

}


extension ZLIssueInfoController: FloatingPanelControllerDelegate {
    
}
 

class ZLIssueFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 44.0, edge: .top, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 80.0, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}
