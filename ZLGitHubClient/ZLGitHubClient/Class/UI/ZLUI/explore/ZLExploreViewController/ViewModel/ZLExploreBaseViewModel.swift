//
//  ZLExploreBaseViewModel.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/8/3.
//  Copyright © 2019 ZM. All rights reserved.
//

import UIKit

class ZLExploreBaseViewModel: ZLBaseViewModel {
    
    var baseView : ZLExploreBaseView?
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: ZLLanguageTypeChange_Notificaiton, object: nil)
    }
    
    override func bindModel(_ targetModel: Any?, andView targetView: UIView) {
        
        if !(targetView is ZLExploreBaseView)
        {
            ZLLog_Warn("targetView is not ZLExploreBaseView,so return")
            return
        }
        self.baseView = targetView as? ZLExploreBaseView
        self.baseView?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(onNotificationArrived(notication:)), name: ZLLanguageTypeChange_Notificaiton, object: nil)
        
        for itemListView in self.baseView!.githubItemListViewArray{
            itemListView.beginRefresh()
        }
    }
    

    @IBAction func onSearchButtonClicked(_ sender: Any) {
//       let vc = ZLSearchController()
//       vc.hidesBottomBarWhenPushed = true
//       self.viewController?.navigationController?.pushViewController(vc, animated: true)
        
        ZLLanguageSelectView.showLanguageSelectView(resultBlock: { (result : String) in
            
        })
        
    }
    

    @objc func onNotificationArrived(notication: Notification)
    {
        ZLLog_Info("notificaition[\(notication) arrived]")
        
        switch notication.name
        {
        case ZLLanguageTypeChange_Notificaiton:do
        {
            self.baseView?.justReloadView()
            }
        default:
            break;
        }
        
    }
}

extension ZLExploreBaseViewModel{
    func getTrendRepo() -> Void {
        weak var weakSelf = self
        
        ZLSearchServiceModel.shared().trending(with:.repositories, language: nil, dateRange: ZLDateRangeDaily, serialNumber: NSString.generateSerialNumber(), completeHandle: { (model:ZLOperationResultModel) in
    
            if model.result == true {
                guard let repoArray : [ZLGithubRepositoryModel] = model.data as?  [ZLGithubRepositoryModel] else {
                    ZLLog_Info("ZLGithubRepositoryModel transfer failed")
                    weakSelf?.baseView?.githubItemListViewArray[0].endRefreshWithError()
                    return
                }
                
                var repoCellDatas : [ZLRepositoryTableViewCellData] = []
                for item in repoArray {
                    let cellData = ZLRepositoryTableViewCellData.init(data: item, needPullData: true)
                    weakSelf!.addSubViewModel(cellData)
                    repoCellDatas.append(cellData)
                }
                
                weakSelf?.baseView?.githubItemListViewArray[0].resetCellDatas(cellDatas: repoCellDatas)
            } else {
                weakSelf?.baseView?.githubItemListViewArray[0].endRefreshWithError()
                ZLLog_Info("Query trending repo failed")
            }
            
        })
    }
    
    func getTrendUser() -> Void {
        
        weak var weakSelf = self
        ZLSearchServiceModel.shared().trending(with:.users, language: nil, dateRange: ZLDateRangeDaily, serialNumber: NSString.generateSerialNumber(), completeHandle: { (model:ZLOperationResultModel) in
            
            if model.result == true {
                guard let userArray : [ZLGithubUserModel] = model.data as?  [ZLGithubUserModel] else {
                    ZLLog_Info("ZLGithubUserModel transfer failed")
                    weakSelf?.baseView?.githubItemListViewArray[1].endRefreshWithError()
                    return
                }
                
                var userCellDatas : [ZLUserTableViewCellData] = []
                for item in userArray {
                    let cellData = ZLUserTableViewCellData.init(userModel: item)
                    weakSelf!.addSubViewModel(cellData)
                    userCellDatas.append(cellData)
                }
                
                weakSelf?.baseView?.githubItemListViewArray[1].resetCellDatas(cellDatas: userCellDatas)
            } else {
                ZLLog_Info("Query trending user failed")
                weakSelf?.baseView?.githubItemListViewArray[1].endRefreshWithError()
            }
            
        })
        
        
    }
}

extension ZLExploreBaseViewModel : ZLExploreBaseViewDelegate{
    
    func githubItemListViewRefreshDragDown(pullRequestListView: ZLGithubItemListView) {
        let tag = pullRequestListView.tag
        switch tag {
        case 0:do{
            self.getTrendRepo()
        }
        case 1:do{
            self.getTrendUser()
            }
        default: break
        }
        
    }
    
    func githubItemListViewRefreshDragUp(pullRequestListView: ZLGithubItemListView) {
        
    }
    
    
    func exploreTypeTitles() -> [String] {
        return [ZLLocalizedString(string: "repositories", comment: ""),ZLLocalizedString(string: "users", comment: "")]
    }
    
    
}
