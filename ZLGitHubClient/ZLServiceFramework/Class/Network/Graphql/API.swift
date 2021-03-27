// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The possible states of a pull request.
public enum PullRequestState: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A pull request that is still open.
  case `open`
  /// A pull request that has been closed without being merged.
  case closed
  /// A pull request that has been closed by being merged.
  case merged
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OPEN": self = .open
      case "CLOSED": self = .closed
      case "MERGED": self = .merged
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "OPEN"
      case .closed: return "CLOSED"
      case .merged: return "MERGED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PullRequestState, rhs: PullRequestState) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.merged, .merged): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PullRequestState] {
    return [
      .open,
      .closed,
      .merged,
    ]
  }
}

/// The possible states of an issue.
public enum IssueState: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An issue that is still open
  case `open`
  /// An issue that has been closed
  case closed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OPEN": self = .open
      case "CLOSED": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "OPEN"
      case .closed: return "CLOSED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: IssueState, rhs: IssueState) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [IssueState] {
    return [
      .open,
      .closed,
    ]
  }
}

public final class ViewerPullRequestQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query viewerPullRequest($state: [PullRequestState!], $after: String) {
      viewer {
        __typename
        pullRequests(
          states: $state
          orderBy: {field: CREATED_AT, direction: DESC}
          after: $after
          first: 20
        ) {
          __typename
          pageInfo {
            __typename
            endCursor
            hasNextPage
          }
          nodes {
            __typename
            title
            state
            number
            author {
              __typename
              login
            }
            url
            createdAt
            closedAt
            mergedAt
          }
        }
      }
    }
    """

  public let operationName: String = "viewerPullRequest"

  public var state: [PullRequestState]?
  public var after: String?

  public init(state: [PullRequestState]?, after: String? = nil) {
    self.state = state
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["state": state, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pullRequests", arguments: ["states": GraphQLVariable("state"), "orderBy": ["field": "CREATED_AT", "direction": "DESC"], "after": GraphQLVariable("after"), "first": 20], type: .nonNull(.object(PullRequest.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pullRequests: PullRequest) {
        self.init(unsafeResultMap: ["__typename": "User", "pullRequests": pullRequests.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of pull requests associated with this user.
      public var pullRequests: PullRequest {
        get {
          return PullRequest(unsafeResultMap: resultMap["pullRequests"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pullRequests")
        }
      }

      public struct PullRequest: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PullRequestConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "PullRequestConnection", "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("endCursor", type: .scalar(String.self)),
              GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil, hasNextPage: Bool) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PullRequest"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("state", type: .nonNull(.scalar(PullRequestState.self))),
              GraphQLField("number", type: .nonNull(.scalar(Int.self))),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("closedAt", type: .scalar(String.self)),
              GraphQLField("mergedAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, state: PullRequestState, number: Int, author: Author? = nil, url: String, createdAt: String, closedAt: String? = nil, mergedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PullRequest", "title": title, "state": state, "number": number, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "url": url, "createdAt": createdAt, "closedAt": closedAt, "mergedAt": mergedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the pull request title.
          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          /// Identifies the state of the pull request.
          public var state: PullRequestState {
            get {
              return resultMap["state"]! as! PullRequestState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          /// Identifies the pull request number.
          public var number: Int {
            get {
              return resultMap["number"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "number")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "author")
            }
          }

          /// The HTTP URL for this pull request.
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Identifies the date and time when the object was closed.
          public var closedAt: String? {
            get {
              return resultMap["closedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "closedAt")
            }
          }

          /// The date and time that the pull request was merged.
          public var mergedAt: String? {
            get {
              return resultMap["mergedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mergedAt")
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeBot(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
            }

            public static func makeEnterpriseUserAccount(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
            }

            public static func makeMannequin(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
            }

            public static func makeOrganization(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }
          }
        }
      }
    }
  }
}

public final class ViewerTopRepositoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query viewerTopRepositories($after: String) {
      viewer {
        __typename
        topRepositories(
          first: 10
          orderBy: {field: UPDATED_AT, direction: DESC}
          after: $after
        ) {
          __typename
          pageInfo {
            __typename
            endCursor
          }
          nodes {
            __typename
            name
            nameWithOwner
            isPrivate
            description
            forkCount
            stargazerCount
            owner {
              __typename
              login
              avatarUrl
            }
            primaryLanguage {
              __typename
              name
            }
            url
          }
        }
      }
    }
    """

  public let operationName: String = "viewerTopRepositories"

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("topRepositories", arguments: ["first": 10, "orderBy": ["field": "UPDATED_AT", "direction": "DESC"], "after": GraphQLVariable("after")], type: .nonNull(.object(TopRepository.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(topRepositories: TopRepository) {
        self.init(unsafeResultMap: ["__typename": "User", "topRepositories": topRepositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Repositories the user has contributed to, ordered by contribution rank, plus repositories the user has created
      public var topRepositories: TopRepository {
        get {
          return TopRepository(unsafeResultMap: resultMap["topRepositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "topRepositories")
        }
      }

      public struct TopRepository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RepositoryConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("endCursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(endCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              GraphQLField("isPrivate", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("forkCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("stargazerCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
              GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, nameWithOwner: String, isPrivate: Bool, description: String? = nil, forkCount: Int, stargazerCount: Int, owner: Owner, primaryLanguage: PrimaryLanguage? = nil, url: String) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner, "isPrivate": isPrivate, "description": description, "forkCount": forkCount, "stargazerCount": stargazerCount, "owner": owner.resultMap, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The repository's name with owner.
          public var nameWithOwner: String {
            get {
              return resultMap["nameWithOwner"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nameWithOwner")
            }
          }

          /// Identifies if the repository is private or internal.
          public var isPrivate: Bool {
            get {
              return resultMap["isPrivate"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isPrivate")
            }
          }

          /// The description of the repository.
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// Returns how many forks there are of this repository in the whole network.
          public var forkCount: Int {
            get {
              return resultMap["forkCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "forkCount")
            }
          }

          /// Returns a count of how many stargazers there are on this object
          public var stargazerCount: Int {
            get {
              return resultMap["stargazerCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "stargazerCount")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "owner")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
            }
          }

          /// The HTTP URL for this repository
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeOrganization(login: String, avatarUrl: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeUser(login: String, avatarUrl: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the owner's public avatar.
            public var avatarUrl: String {
              get {
                return resultMap["avatarUrl"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Language"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}

public final class SearchIssuesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query searchIssues($after: String, $query: String!) {
      search(query: $query, first: 10, type: ISSUE, after: $after) {
        __typename
        issueCount
        pageInfo {
          __typename
          hasNextPage
          endCursor
          startCursor
        }
        nodes {
          __typename
          ... on Issue {
            number
            title
            body
            url
            state
            labels(first: 5, orderBy: {field: CREATED_AT, direction: DESC}) {
              __typename
              nodes {
                __typename
                color
                name
              }
            }
            author {
              __typename
              login
            }
            repository {
              __typename
              name
              nameWithOwner
            }
            createdAt
            updatedAt
            closedAt
          }
        }
      }
    }
    """

  public let operationName: String = "searchIssues"

  public var after: String?
  public var query: String

  public init(after: String? = nil, query: String) {
    self.after = after
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["after": after, "query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["query": GraphQLVariable("query"), "first": 10, "type": "ISSUE", "after": GraphQLVariable("after")], type: .nonNull(.object(Search.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SearchResultItemConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("issueCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issueCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "issueCount": issueCount, "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of issues that matched the search query.
      public var issueCount: Int {
        get {
          return resultMap["issueCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "issueCount")
        }
      }

      /// Information to aid in pagination.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool, endCursor: String? = nil, startCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating backwards, the cursor to continue.
        public var startCursor: String? {
          get {
            return resultMap["startCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["App", "Issue", "MarketplaceListing", "Organization", "PullRequest", "Repository", "User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Issue": AsIssue.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeApp() -> Node {
          return Node(unsafeResultMap: ["__typename": "App"])
        }

        public static func makeMarketplaceListing() -> Node {
          return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
        }

        public static func makeOrganization() -> Node {
          return Node(unsafeResultMap: ["__typename": "Organization"])
        }

        public static func makePullRequest() -> Node {
          return Node(unsafeResultMap: ["__typename": "PullRequest"])
        }

        public static func makeRepository() -> Node {
          return Node(unsafeResultMap: ["__typename": "Repository"])
        }

        public static func makeUser() -> Node {
          return Node(unsafeResultMap: ["__typename": "User"])
        }

        public static func makeIssue(number: Int, title: String, body: String, url: String, state: IssueState, labels: AsIssue.Label? = nil, author: AsIssue.Author? = nil, repository: AsIssue.Repository, createdAt: String, updatedAt: String, closedAt: String? = nil) -> Node {
          return Node(unsafeResultMap: ["__typename": "Issue", "number": number, "title": title, "body": body, "url": url, "state": state, "labels": labels.flatMap { (value: AsIssue.Label) -> ResultMap in value.resultMap }, "author": author.flatMap { (value: AsIssue.Author) -> ResultMap in value.resultMap }, "repository": repository.resultMap, "createdAt": createdAt, "updatedAt": updatedAt, "closedAt": closedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asIssue: AsIssue? {
          get {
            if !AsIssue.possibleTypes.contains(__typename) { return nil }
            return AsIssue(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsIssue: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Issue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("number", type: .nonNull(.scalar(Int.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("body", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("state", type: .nonNull(.scalar(IssueState.self))),
              GraphQLField("labels", arguments: ["first": 5, "orderBy": ["field": "CREATED_AT", "direction": "DESC"]], type: .object(Label.selections)),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("closedAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(number: Int, title: String, body: String, url: String, state: IssueState, labels: Label? = nil, author: Author? = nil, repository: Repository, createdAt: String, updatedAt: String, closedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Issue", "number": number, "title": title, "body": body, "url": url, "state": state, "labels": labels.flatMap { (value: Label) -> ResultMap in value.resultMap }, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "repository": repository.resultMap, "createdAt": createdAt, "updatedAt": updatedAt, "closedAt": closedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the issue number.
          public var number: Int {
            get {
              return resultMap["number"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "number")
            }
          }

          /// Identifies the issue title.
          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          /// Identifies the body of the issue.
          public var body: String {
            get {
              return resultMap["body"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "body")
            }
          }

          /// The HTTP URL for this issue
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          /// Identifies the state of the issue.
          public var state: IssueState {
            get {
              return resultMap["state"]! as! IssueState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          /// A list of labels associated with the object.
          public var labels: Label? {
            get {
              return (resultMap["labels"] as? ResultMap).flatMap { Label(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "labels")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "author")
            }
          }

          /// The repository associated with this node.
          public var repository: Repository {
            get {
              return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "repository")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Identifies the date and time when the object was last updated.
          public var updatedAt: String {
            get {
              return resultMap["updatedAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          /// Identifies the date and time when the object was closed.
          public var closedAt: String? {
            get {
              return resultMap["closedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "closedAt")
            }
          }

          public struct Label: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["LabelConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "LabelConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Label"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("color", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(color: String, name: String) {
                self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the label color.
              public var color: String {
                get {
                  return resultMap["color"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "color")
                }
              }

              /// Identifies the label name.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeBot(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
            }

            public static func makeEnterpriseUserAccount(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
            }

            public static func makeMannequin(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
            }

            public static func makeOrganization(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }
          }

          public struct Repository: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Repository"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, nameWithOwner: String) {
              self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The repository's name with owner.
            public var nameWithOwner: String {
              get {
                return resultMap["nameWithOwner"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "nameWithOwner")
              }
            }
          }
        }
      }
    }
  }
}

public final class ViewerIssuesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query viewerIssues($assignee: String, $creator: String, $mentioned: String, $after: String) {
      viewer {
        __typename
        issues(
          after: $after
          orderBy: {field: UPDATED_AT, direction: DESC}
          first: 10
          filterBy: {createdBy: $creator, mentioned: $mentioned, assignee: $assignee}
        ) {
          __typename
          pageInfo {
            __typename
            hasNextPage
            endCursor
            startCursor
          }
          nodes {
            __typename
            number
            title
            body
            url
            state
            labels(first: 5, orderBy: {field: CREATED_AT, direction: DESC}) {
              __typename
              nodes {
                __typename
                color
                name
              }
            }
            author {
              __typename
              login
            }
            repository {
              __typename
              name
              nameWithOwner
            }
            createdAt
            updatedAt
            closedAt
          }
        }
      }
    }
    """

  public let operationName: String = "viewerIssues"

  public var assignee: String?
  public var creator: String?
  public var mentioned: String?
  public var after: String?

  public init(assignee: String? = nil, creator: String? = nil, mentioned: String? = nil, after: String? = nil) {
    self.assignee = assignee
    self.creator = creator
    self.mentioned = mentioned
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["assignee": assignee, "creator": creator, "mentioned": mentioned, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("issues", arguments: ["after": GraphQLVariable("after"), "orderBy": ["field": "UPDATED_AT", "direction": "DESC"], "first": 10, "filterBy": ["createdBy": GraphQLVariable("creator"), "mentioned": GraphQLVariable("mentioned"), "assignee": GraphQLVariable("assignee")]], type: .nonNull(.object(Issue.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issues: Issue) {
        self.init(unsafeResultMap: ["__typename": "User", "issues": issues.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of issues associated with this user.
      public var issues: Issue {
        get {
          return Issue(unsafeResultMap: resultMap["issues"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "issues")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IssueConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "IssueConnection", "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("endCursor", type: .scalar(String.self)),
              GraphQLField("startCursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hasNextPage: Bool, endCursor: String? = nil, startCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return resultMap["startCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Issue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("number", type: .nonNull(.scalar(Int.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("body", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("state", type: .nonNull(.scalar(IssueState.self))),
              GraphQLField("labels", arguments: ["first": 5, "orderBy": ["field": "CREATED_AT", "direction": "DESC"]], type: .object(Label.selections)),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("closedAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(number: Int, title: String, body: String, url: String, state: IssueState, labels: Label? = nil, author: Author? = nil, repository: Repository, createdAt: String, updatedAt: String, closedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Issue", "number": number, "title": title, "body": body, "url": url, "state": state, "labels": labels.flatMap { (value: Label) -> ResultMap in value.resultMap }, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "repository": repository.resultMap, "createdAt": createdAt, "updatedAt": updatedAt, "closedAt": closedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the issue number.
          public var number: Int {
            get {
              return resultMap["number"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "number")
            }
          }

          /// Identifies the issue title.
          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          /// Identifies the body of the issue.
          public var body: String {
            get {
              return resultMap["body"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "body")
            }
          }

          /// The HTTP URL for this issue
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          /// Identifies the state of the issue.
          public var state: IssueState {
            get {
              return resultMap["state"]! as! IssueState
            }
            set {
              resultMap.updateValue(newValue, forKey: "state")
            }
          }

          /// A list of labels associated with the object.
          public var labels: Label? {
            get {
              return (resultMap["labels"] as? ResultMap).flatMap { Label(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "labels")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "author")
            }
          }

          /// The repository associated with this node.
          public var repository: Repository {
            get {
              return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "repository")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Identifies the date and time when the object was last updated.
          public var updatedAt: String {
            get {
              return resultMap["updatedAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          /// Identifies the date and time when the object was closed.
          public var closedAt: String? {
            get {
              return resultMap["closedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "closedAt")
            }
          }

          public struct Label: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["LabelConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "LabelConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Label"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("color", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(color: String, name: String) {
                self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the label color.
              public var color: String {
                get {
                  return resultMap["color"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "color")
                }
              }

              /// Identifies the label name.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeBot(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
            }

            public static func makeEnterpriseUserAccount(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
            }

            public static func makeMannequin(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
            }

            public static func makeOrganization(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Author {
              return Author(unsafeResultMap: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }
          }

          public struct Repository: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Repository"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, nameWithOwner: String) {
              self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The repository's name with owner.
            public var nameWithOwner: String {
              get {
                return resultMap["nameWithOwner"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "nameWithOwner")
              }
            }
          }
        }
      }
    }
  }
}

public final class ViewerOrgsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query viewerOrgs {
      viewer {
        __typename
        organizations(first: 20) {
          __typename
          totalCount
          edges {
            __typename
            node {
              __typename
              login
              avatarUrl
              location
            }
          }
        }
      }
    }
    """

  public let operationName: String = "viewerOrgs"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("organizations", arguments: ["first": 20], type: .nonNull(.object(Organization.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(organizations: Organization) {
        self.init(unsafeResultMap: ["__typename": "User", "organizations": organizations.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of organizations the user belongs to.
      public var organizations: Organization {
        get {
          return Organization(unsafeResultMap: resultMap["organizations"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "organizations")
        }
      }

      public struct Organization: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrganizationConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "OrganizationConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["OrganizationEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "OrganizationEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Organization"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                GraphQLField("location", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(login: String, avatarUrl: String, location: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl, "location": location])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The organization's login name.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the organization's public avatar.
            public var avatarUrl: String {
              get {
                return resultMap["avatarUrl"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatarUrl")
              }
            }

            /// The organization's public profile location.
            public var location: String? {
              get {
                return resultMap["location"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "location")
              }
            }
          }
        }
      }
    }
  }
}

public final class WorkboardInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkboardInfo {
      viewer {
        __typename
        issues(first: 3, states: OPEN, orderBy: {field: UPDATED_AT, direction: DESC}) {
          __typename
          totalCount
          edges {
            __typename
            node {
              __typename
              title
              number
              createdAt
              author {
                __typename
                login
              }
            }
          }
        }
        pullRequests(first: 3, states: OPEN) {
          __typename
          totalCount
          edges {
            __typename
            node {
              __typename
              title
              number
              author {
                __typename
                login
              }
              createdAt
            }
          }
        }
        topRepositories(first: 3, orderBy: {field: UPDATED_AT, direction: DESC}) {
          __typename
          edges {
            __typename
            node {
              __typename
              nameWithOwner
            }
          }
        }
        bio
        websiteUrl
      }
    }
    """

  public let operationName: String = "WorkboardInfo"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("issues", arguments: ["first": 3, "states": "OPEN", "orderBy": ["field": "UPDATED_AT", "direction": "DESC"]], type: .nonNull(.object(Issue.selections))),
          GraphQLField("pullRequests", arguments: ["first": 3, "states": "OPEN"], type: .nonNull(.object(PullRequest.selections))),
          GraphQLField("topRepositories", arguments: ["first": 3, "orderBy": ["field": "UPDATED_AT", "direction": "DESC"]], type: .nonNull(.object(TopRepository.selections))),
          GraphQLField("bio", type: .scalar(String.self)),
          GraphQLField("websiteUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issues: Issue, pullRequests: PullRequest, topRepositories: TopRepository, bio: String? = nil, websiteUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "issues": issues.resultMap, "pullRequests": pullRequests.resultMap, "topRepositories": topRepositories.resultMap, "bio": bio, "websiteUrl": websiteUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of issues associated with this user.
      public var issues: Issue {
        get {
          return Issue(unsafeResultMap: resultMap["issues"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "issues")
        }
      }

      /// A list of pull requests associated with this user.
      public var pullRequests: PullRequest {
        get {
          return PullRequest(unsafeResultMap: resultMap["pullRequests"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pullRequests")
        }
      }

      /// Repositories the user has contributed to, ordered by contribution rank, plus repositories the user has created
      public var topRepositories: TopRepository {
        get {
          return TopRepository(unsafeResultMap: resultMap["topRepositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "topRepositories")
        }
      }

      /// The user's public profile bio.
      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      /// A URL pointing to the user's public website/blog.
      public var websiteUrl: String? {
        get {
          return resultMap["websiteUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "websiteUrl")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["IssueConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "IssueConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["IssueEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "IssueEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Issue"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("author", type: .object(Author.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String, number: Int, createdAt: String, author: Author? = nil) {
              self.init(unsafeResultMap: ["__typename": "Issue", "title": title, "number": number, "createdAt": createdAt, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the issue title.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// Identifies the issue number.
            public var number: Int {
              get {
                return resultMap["number"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "number")
              }
            }

            /// Identifies the date and time when the object was created.
            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }

            /// The actor who authored the comment.
            public var author: Author? {
              get {
                return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "author")
              }
            }

            public struct Author: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("login", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeBot(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
              }

              public static func makeEnterpriseUserAccount(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
              }

              public static func makeMannequin(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
              }

              public static func makeOrganization(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
              }

              public static func makeUser(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "User", "login": login])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The username of the actor.
              public var login: String {
                get {
                  return resultMap["login"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "login")
                }
              }
            }
          }
        }
      }

      public struct PullRequest: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PullRequestConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "PullRequestConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PullRequestEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "PullRequestEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PullRequest"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                GraphQLField("author", type: .object(Author.selections)),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String, number: Int, author: Author? = nil, createdAt: String) {
              self.init(unsafeResultMap: ["__typename": "PullRequest", "title": title, "number": number, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "createdAt": createdAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the pull request title.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// Identifies the pull request number.
            public var number: Int {
              get {
                return resultMap["number"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "number")
              }
            }

            /// The actor who authored the comment.
            public var author: Author? {
              get {
                return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "author")
              }
            }

            /// Identifies the date and time when the object was created.
            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }

            public struct Author: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("login", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeBot(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
              }

              public static func makeEnterpriseUserAccount(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
              }

              public static func makeMannequin(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
              }

              public static func makeOrganization(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
              }

              public static func makeUser(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "User", "login": login])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The username of the actor.
              public var login: String {
                get {
                  return resultMap["login"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "login")
                }
              }
            }
          }
        }
      }

      public struct TopRepository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RepositoryConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RepositoryEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "RepositoryEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Repository"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nameWithOwner: String) {
              self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The repository's name with owner.
            public var nameWithOwner: String {
              get {
                return resultMap["nameWithOwner"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "nameWithOwner")
              }
            }
          }
        }
      }
    }
  }
}

public final class IssueInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query issueInfo($owner: String!, $name: String!, $number: Int!, $after: String) {
      repository(owner: $owner, name: $name) {
        __typename
        nameWithOwner
        owner {
          __typename
          login
          avatarUrl
        }
        issue(number: $number) {
          __typename
          title
          number
          author {
            __typename
            login
            avatarUrl
          }
          bodyText
          bodyHTML
          state
          closed
          closedAt
          createdAt
          timelineItems(first: 10, after: $after) {
            __typename
            totalCount
            pageInfo {
              __typename
              startCursor
              endCursor
              hasNextPage
            }
            nodes {
              __typename
              ... on AddedToProjectEvent {
                id
                actor {
                  __typename
                  login
                  avatarUrl
                }
                createdAt
              }
              ... on AssignedEvent {
                id
                actor {
                  __typename
                  login
                  avatarUrl
                }
                assignee {
                  __typename
                  ... on User {
                    login
                  }
                  ... on Bot {
                    login
                  }
                  ... on Mannequin {
                    login
                  }
                  ... on Organization {
                    login
                  }
                }
              }
              ... on ClosedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on CommentDeletedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ConnectedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ConvertedNoteToIssueEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on CrossReferencedEvent {
                actor {
                  __typename
                  login
                }
                target {
                  __typename
                  ... on Issue {
                    url
                    title
                    number
                    repository {
                      __typename
                      owner {
                        __typename
                        login
                      }
                      name
                    }
                  }
                  ... on PullRequest {
                    url
                    title
                    number
                    repository {
                      __typename
                      owner {
                        __typename
                        login
                      }
                      name
                    }
                  }
                }
              }
              ... on DemilestonedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on DisconnectedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on IssueComment {
                id
                author {
                  __typename
                  login
                  avatarUrl
                }
                bodyText
                bodyHTML
                url
                lastEditedAt
                publishedAt
              }
              ... on LabeledEvent {
                actor {
                  __typename
                  login
                }
                label {
                  __typename
                  color
                  name
                }
              }
              ... on LockedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MarkedAsDuplicateEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MentionedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MilestonedEvent {
                actor {
                  __typename
                  login
                }
                milestoneTitle
              }
              ... on MovedColumnsInProjectEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on PinnedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ReferencedEvent {
                actor {
                  __typename
                  login
                }
                nullableName: commit {
                  __typename
                  commitUrl
                  message
                  messageHeadline
                }
              }
              ... on RemovedFromProjectEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on RenamedTitleEvent {
                actor {
                  __typename
                  login
                }
                previousTitle
                currentTitle
              }
              ... on ReopenedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on SubscribedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on TransferredEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnassignedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnlabeledEvent {
                actor {
                  __typename
                  login
                }
                label {
                  __typename
                  color
                  name
                }
              }
              ... on UnlockedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnmarkedAsDuplicateEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnpinnedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnsubscribedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UserBlockedEvent {
                actor {
                  __typename
                  login
                }
                subject {
                  __typename
                  login
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "issueInfo"

  public var owner: String
  public var name: String
  public var number: Int
  public var after: String?

  public init(owner: String, name: String, number: Int, after: String? = nil) {
    self.owner = owner
    self.name = name
    self.number = number
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["owner": owner, "name": name, "number": number, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("repository", arguments: ["owner": GraphQLVariable("owner"), "name": GraphQLVariable("name")], type: .object(Repository.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
          GraphQLField("issue", arguments: ["number": GraphQLVariable("number")], type: .object(Issue.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nameWithOwner: String, owner: Owner, issue: Issue? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner, "owner": owner.resultMap, "issue": issue.flatMap { (value: Issue) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The repository's name with owner.
      public var nameWithOwner: String {
        get {
          return resultMap["nameWithOwner"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nameWithOwner")
        }
      }

      /// The User owner of the repository.
      public var owner: Owner {
        get {
          return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "owner")
        }
      }

      /// Returns a single issue from the current repository by number.
      public var issue: Issue? {
        get {
          return (resultMap["issue"] as? ResultMap).flatMap { Issue(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "issue")
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Organization", "User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("login", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeOrganization(login: String, avatarUrl: String) -> Owner {
          return Owner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
        }

        public static func makeUser(login: String, avatarUrl: String) -> Owner {
          return Owner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return resultMap["login"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "login")
          }
        }

        /// A URL pointing to the owner's public avatar.
        public var avatarUrl: String {
          get {
            return resultMap["avatarUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatarUrl")
          }
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Issue"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("number", type: .nonNull(.scalar(Int.self))),
            GraphQLField("author", type: .object(Author.selections)),
            GraphQLField("bodyText", type: .nonNull(.scalar(String.self))),
            GraphQLField("bodyHTML", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(IssueState.self))),
            GraphQLField("closed", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("closedAt", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("timelineItems", arguments: ["first": 10, "after": GraphQLVariable("after")], type: .nonNull(.object(TimelineItem.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, number: Int, author: Author? = nil, bodyText: String, bodyHtml: String, state: IssueState, closed: Bool, closedAt: String? = nil, createdAt: String, timelineItems: TimelineItem) {
          self.init(unsafeResultMap: ["__typename": "Issue", "title": title, "number": number, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "state": state, "closed": closed, "closedAt": closedAt, "createdAt": createdAt, "timelineItems": timelineItems.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the issue title.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// Identifies the issue number.
        public var number: Int {
          get {
            return resultMap["number"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "number")
          }
        }

        /// The actor who authored the comment.
        public var author: Author? {
          get {
            return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "author")
          }
        }

        /// Identifies the body of the issue rendered to text.
        public var bodyText: String {
          get {
            return resultMap["bodyText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bodyText")
          }
        }

        /// The body rendered to HTML.
        public var bodyHtml: String {
          get {
            return resultMap["bodyHTML"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bodyHTML")
          }
        }

        /// Identifies the state of the issue.
        public var state: IssueState {
          get {
            return resultMap["state"]! as! IssueState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        /// `true` if the object is closed (definition of closed may depend on type)
        public var closed: Bool {
          get {
            return resultMap["closed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "closed")
          }
        }

        /// Identifies the date and time when the object was closed.
        public var closedAt: String? {
          get {
            return resultMap["closedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "closedAt")
          }
        }

        /// Identifies the date and time when the object was created.
        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// A list of events, comments, commits, etc. associated with the issue.
        public var timelineItems: TimelineItem {
          get {
            return TimelineItem(unsafeResultMap: resultMap["timelineItems"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "timelineItems")
          }
        }

        public struct Author: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeBot(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeMannequin(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeOrganization(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeUser(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The username of the actor.
          public var login: String {
            get {
              return resultMap["login"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "login")
            }
          }

          /// A URL pointing to the actor's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }
        }

        public struct TimelineItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["IssueTimelineItemsConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(totalCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "IssueTimelineItemsConnection", "totalCount": totalCount, "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the total count of items in the connection.
          public var totalCount: Int {
            get {
              return resultMap["totalCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalCount")
            }
          }

          /// Information to aid in pagination.
          public var pageInfo: PageInfo {
            get {
              return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
            }
          }

          /// A list of nodes.
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("startCursor", type: .scalar(String.self)),
                GraphQLField("endCursor", type: .scalar(String.self)),
                GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(startCursor: String? = nil, endCursor: String? = nil, hasNextPage: Bool) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "startCursor": startCursor, "endCursor": endCursor, "hasNextPage": hasNextPage])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// When paginating backwards, the cursor to continue.
            public var startCursor: String? {
              get {
                return resultMap["startCursor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startCursor")
              }
            }

            /// When paginating forwards, the cursor to continue.
            public var endCursor: String? {
              get {
                return resultMap["endCursor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "endCursor")
              }
            }

            /// When paginating forwards, are there more items?
            public var hasNextPage: Bool {
              get {
                return resultMap["hasNextPage"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "hasNextPage")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AddedToProjectEvent", "AssignedEvent", "ClosedEvent", "CommentDeletedEvent", "ConnectedEvent", "ConvertedNoteToIssueEvent", "CrossReferencedEvent", "DemilestonedEvent", "DisconnectedEvent", "IssueComment", "LabeledEvent", "LockedEvent", "MarkedAsDuplicateEvent", "MentionedEvent", "MilestonedEvent", "MovedColumnsInProjectEvent", "PinnedEvent", "ReferencedEvent", "RemovedFromProjectEvent", "RenamedTitleEvent", "ReopenedEvent", "SubscribedEvent", "TransferredEvent", "UnassignedEvent", "UnlabeledEvent", "UnlockedEvent", "UnmarkedAsDuplicateEvent", "UnpinnedEvent", "UnsubscribedEvent", "UserBlockedEvent"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLTypeCase(
                  variants: ["AddedToProjectEvent": AsAddedToProjectEvent.selections, "AssignedEvent": AsAssignedEvent.selections, "ClosedEvent": AsClosedEvent.selections, "CommentDeletedEvent": AsCommentDeletedEvent.selections, "ConnectedEvent": AsConnectedEvent.selections, "ConvertedNoteToIssueEvent": AsConvertedNoteToIssueEvent.selections, "CrossReferencedEvent": AsCrossReferencedEvent.selections, "DemilestonedEvent": AsDemilestonedEvent.selections, "DisconnectedEvent": AsDisconnectedEvent.selections, "IssueComment": AsIssueComment.selections, "LabeledEvent": AsLabeledEvent.selections, "LockedEvent": AsLockedEvent.selections, "MarkedAsDuplicateEvent": AsMarkedAsDuplicateEvent.selections, "MentionedEvent": AsMentionedEvent.selections, "MilestonedEvent": AsMilestonedEvent.selections, "MovedColumnsInProjectEvent": AsMovedColumnsInProjectEvent.selections, "PinnedEvent": AsPinnedEvent.selections, "ReferencedEvent": AsReferencedEvent.selections, "RemovedFromProjectEvent": AsRemovedFromProjectEvent.selections, "RenamedTitleEvent": AsRenamedTitleEvent.selections, "ReopenedEvent": AsReopenedEvent.selections, "SubscribedEvent": AsSubscribedEvent.selections, "TransferredEvent": AsTransferredEvent.selections, "UnassignedEvent": AsUnassignedEvent.selections, "UnlabeledEvent": AsUnlabeledEvent.selections, "UnlockedEvent": AsUnlockedEvent.selections, "UnmarkedAsDuplicateEvent": AsUnmarkedAsDuplicateEvent.selections, "UnpinnedEvent": AsUnpinnedEvent.selections, "UnsubscribedEvent": AsUnsubscribedEvent.selections, "UserBlockedEvent": AsUserBlockedEvent.selections],
                  default: [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                )
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeAddedToProjectEvent(id: GraphQLID, actor: AsAddedToProjectEvent.Actor? = nil, createdAt: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "AddedToProjectEvent", "id": id, "actor": actor.flatMap { (value: AsAddedToProjectEvent.Actor) -> ResultMap in value.resultMap }, "createdAt": createdAt])
            }

            public static func makeAssignedEvent(id: GraphQLID, actor: AsAssignedEvent.Actor? = nil, assignee: AsAssignedEvent.Assignee? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AssignedEvent", "id": id, "actor": actor.flatMap { (value: AsAssignedEvent.Actor) -> ResultMap in value.resultMap }, "assignee": assignee.flatMap { (value: AsAssignedEvent.Assignee) -> ResultMap in value.resultMap }])
            }

            public static func makeClosedEvent(actor: AsClosedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ClosedEvent", "actor": actor.flatMap { (value: AsClosedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeCommentDeletedEvent(actor: AsCommentDeletedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "CommentDeletedEvent", "actor": actor.flatMap { (value: AsCommentDeletedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeConnectedEvent(actor: AsConnectedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ConnectedEvent", "actor": actor.flatMap { (value: AsConnectedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeConvertedNoteToIssueEvent(actor: AsConvertedNoteToIssueEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ConvertedNoteToIssueEvent", "actor": actor.flatMap { (value: AsConvertedNoteToIssueEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeCrossReferencedEvent(actor: AsCrossReferencedEvent.Actor? = nil, target: AsCrossReferencedEvent.Target) -> Node {
              return Node(unsafeResultMap: ["__typename": "CrossReferencedEvent", "actor": actor.flatMap { (value: AsCrossReferencedEvent.Actor) -> ResultMap in value.resultMap }, "target": target.resultMap])
            }

            public static func makeDemilestonedEvent(actor: AsDemilestonedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DemilestonedEvent", "actor": actor.flatMap { (value: AsDemilestonedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeDisconnectedEvent(actor: AsDisconnectedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DisconnectedEvent", "actor": actor.flatMap { (value: AsDisconnectedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeIssueComment(id: GraphQLID, author: AsIssueComment.Author? = nil, bodyText: String, bodyHtml: String, url: String, lastEditedAt: String? = nil, publishedAt: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "IssueComment", "id": id, "author": author.flatMap { (value: AsIssueComment.Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "url": url, "lastEditedAt": lastEditedAt, "publishedAt": publishedAt])
            }

            public static func makeLabeledEvent(actor: AsLabeledEvent.Actor? = nil, label: AsLabeledEvent.Label) -> Node {
              return Node(unsafeResultMap: ["__typename": "LabeledEvent", "actor": actor.flatMap { (value: AsLabeledEvent.Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
            }

            public static func makeLockedEvent(actor: AsLockedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "LockedEvent", "actor": actor.flatMap { (value: AsLockedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMarkedAsDuplicateEvent(actor: AsMarkedAsDuplicateEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MarkedAsDuplicateEvent", "actor": actor.flatMap { (value: AsMarkedAsDuplicateEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMentionedEvent(actor: AsMentionedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MentionedEvent", "actor": actor.flatMap { (value: AsMentionedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMilestonedEvent(actor: AsMilestonedEvent.Actor? = nil, milestoneTitle: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "MilestonedEvent", "actor": actor.flatMap { (value: AsMilestonedEvent.Actor) -> ResultMap in value.resultMap }, "milestoneTitle": milestoneTitle])
            }

            public static func makeMovedColumnsInProjectEvent(actor: AsMovedColumnsInProjectEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MovedColumnsInProjectEvent", "actor": actor.flatMap { (value: AsMovedColumnsInProjectEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makePinnedEvent(actor: AsPinnedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "PinnedEvent", "actor": actor.flatMap { (value: AsPinnedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeReferencedEvent(actor: AsReferencedEvent.Actor? = nil, nullableName: AsReferencedEvent.NullableName? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReferencedEvent", "actor": actor.flatMap { (value: AsReferencedEvent.Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: AsReferencedEvent.NullableName) -> ResultMap in value.resultMap }])
            }

            public static func makeRemovedFromProjectEvent(actor: AsRemovedFromProjectEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "RemovedFromProjectEvent", "actor": actor.flatMap { (value: AsRemovedFromProjectEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeRenamedTitleEvent(actor: AsRenamedTitleEvent.Actor? = nil, previousTitle: String, currentTitle: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "RenamedTitleEvent", "actor": actor.flatMap { (value: AsRenamedTitleEvent.Actor) -> ResultMap in value.resultMap }, "previousTitle": previousTitle, "currentTitle": currentTitle])
            }

            public static func makeReopenedEvent(actor: AsReopenedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReopenedEvent", "actor": actor.flatMap { (value: AsReopenedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeSubscribedEvent(actor: AsSubscribedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "SubscribedEvent", "actor": actor.flatMap { (value: AsSubscribedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeTransferredEvent(actor: AsTransferredEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "TransferredEvent", "actor": actor.flatMap { (value: AsTransferredEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnassignedEvent(actor: AsUnassignedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnassignedEvent", "actor": actor.flatMap { (value: AsUnassignedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnlabeledEvent(actor: AsUnlabeledEvent.Actor? = nil, label: AsUnlabeledEvent.Label) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnlabeledEvent", "actor": actor.flatMap { (value: AsUnlabeledEvent.Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
            }

            public static func makeUnlockedEvent(actor: AsUnlockedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnlockedEvent", "actor": actor.flatMap { (value: AsUnlockedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnmarkedAsDuplicateEvent(actor: AsUnmarkedAsDuplicateEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnmarkedAsDuplicateEvent", "actor": actor.flatMap { (value: AsUnmarkedAsDuplicateEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnpinnedEvent(actor: AsUnpinnedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnpinnedEvent", "actor": actor.flatMap { (value: AsUnpinnedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnsubscribedEvent(actor: AsUnsubscribedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnsubscribedEvent", "actor": actor.flatMap { (value: AsUnsubscribedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUserBlockedEvent(actor: AsUserBlockedEvent.Actor? = nil, subject: AsUserBlockedEvent.Subject? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UserBlockedEvent", "actor": actor.flatMap { (value: AsUserBlockedEvent.Actor) -> ResultMap in value.resultMap }, "subject": subject.flatMap { (value: AsUserBlockedEvent.Subject) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var asAddedToProjectEvent: AsAddedToProjectEvent? {
              get {
                if !AsAddedToProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsAddedToProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAddedToProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AddedToProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, actor: Actor? = nil, createdAt: String) {
                self.init(unsafeResultMap: ["__typename": "AddedToProjectEvent", "id": id, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "createdAt": createdAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the date and time when the object was created.
              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }
            }

            public var asAssignedEvent: AsAssignedEvent? {
              get {
                if !AsAssignedEvent.possibleTypes.contains(__typename) { return nil }
                return AsAssignedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAssignedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AssignedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("assignee", type: .object(Assignee.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, actor: Actor? = nil, assignee: Assignee? = nil) {
                self.init(unsafeResultMap: ["__typename": "AssignedEvent", "id": id, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "assignee": assignee.flatMap { (value: Assignee) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the user or mannequin that was assigned.
              public var assignee: Assignee? {
                get {
                  return (resultMap["assignee"] as? ResultMap).flatMap { Assignee(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "assignee")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }

              public struct Assignee: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["User": AsUser.selections, "Bot": AsBot.selections, "Mannequin": AsMannequin.selections, "Organization": AsOrganization.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeUser(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public static func makeBot(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeMannequin(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asUser: AsUser? {
                  get {
                    if !AsUser.possibleTypes.contains(__typename) { return nil }
                    return AsUser(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsUser: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["User"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username used to login.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asBot: AsBot? {
                  get {
                    if !AsBot.possibleTypes.contains(__typename) { return nil }
                    return AsBot(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsBot: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Bot"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asMannequin: AsMannequin? {
                  get {
                    if !AsMannequin.possibleTypes.contains(__typename) { return nil }
                    return AsMannequin(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsMannequin: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Mannequin"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asOrganization: AsOrganization? {
                  get {
                    if !AsOrganization.possibleTypes.contains(__typename) { return nil }
                    return AsOrganization(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsOrganization: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Organization"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Organization", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The organization's login name.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }
            }

            public var asClosedEvent: AsClosedEvent? {
              get {
                if !AsClosedEvent.possibleTypes.contains(__typename) { return nil }
                return AsClosedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsClosedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ClosedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ClosedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asCommentDeletedEvent: AsCommentDeletedEvent? {
              get {
                if !AsCommentDeletedEvent.possibleTypes.contains(__typename) { return nil }
                return AsCommentDeletedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsCommentDeletedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CommentDeletedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "CommentDeletedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asConnectedEvent: AsConnectedEvent? {
              get {
                if !AsConnectedEvent.possibleTypes.contains(__typename) { return nil }
                return AsConnectedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsConnectedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ConnectedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ConnectedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asConvertedNoteToIssueEvent: AsConvertedNoteToIssueEvent? {
              get {
                if !AsConvertedNoteToIssueEvent.possibleTypes.contains(__typename) { return nil }
                return AsConvertedNoteToIssueEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsConvertedNoteToIssueEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ConvertedNoteToIssueEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ConvertedNoteToIssueEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asCrossReferencedEvent: AsCrossReferencedEvent? {
              get {
                if !AsCrossReferencedEvent.possibleTypes.contains(__typename) { return nil }
                return AsCrossReferencedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsCrossReferencedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CrossReferencedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("target", type: .nonNull(.object(Target.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, target: Target) {
                self.init(unsafeResultMap: ["__typename": "CrossReferencedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "target": target.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Issue or pull request to which the reference was made.
              public var target: Target {
                get {
                  return Target(unsafeResultMap: resultMap["target"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "target")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Target: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Issue", "PullRequest"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["Issue": AsIssue.selections, "PullRequest": AsPullRequest.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeIssue(url: String, title: String, number: Int, repository: AsIssue.Repository) -> Target {
                  return Target(unsafeResultMap: ["__typename": "Issue", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                }

                public static func makePullRequest(url: String, title: String, number: Int, repository: AsPullRequest.Repository) -> Target {
                  return Target(unsafeResultMap: ["__typename": "PullRequest", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asIssue: AsIssue? {
                  get {
                    if !AsIssue.possibleTypes.contains(__typename) { return nil }
                    return AsIssue(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsIssue: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Issue"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("title", type: .nonNull(.scalar(String.self))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, title: String, number: Int, repository: Repository) {
                    self.init(unsafeResultMap: ["__typename": "Issue", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The HTTP URL for this issue
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// Identifies the issue title.
                  public var title: String {
                    get {
                      return resultMap["title"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the issue number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(owner: Owner, name: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "owner": owner.resultMap, "name": name])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The User owner of the repository.
                    public var owner: Owner {
                      get {
                        return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "owner")
                      }
                    }

                    /// The name of the repository.
                    public var name: String {
                      get {
                        return resultMap["name"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }

                    public struct Owner: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["Organization", "User"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("login", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public static func makeOrganization(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
                      }

                      public static func makeUser(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "User", "login": login])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username used to login.
                      public var login: String {
                        get {
                          return resultMap["login"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "login")
                        }
                      }
                    }
                  }
                }

                public var asPullRequest: AsPullRequest? {
                  get {
                    if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                    return AsPullRequest(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsPullRequest: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["PullRequest"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("title", type: .nonNull(.scalar(String.self))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, title: String, number: Int, repository: Repository) {
                    self.init(unsafeResultMap: ["__typename": "PullRequest", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The HTTP URL for this pull request.
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// Identifies the pull request title.
                  public var title: String {
                    get {
                      return resultMap["title"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the pull request number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(owner: Owner, name: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "owner": owner.resultMap, "name": name])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The User owner of the repository.
                    public var owner: Owner {
                      get {
                        return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "owner")
                      }
                    }

                    /// The name of the repository.
                    public var name: String {
                      get {
                        return resultMap["name"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }

                    public struct Owner: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["Organization", "User"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("login", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public static func makeOrganization(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
                      }

                      public static func makeUser(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "User", "login": login])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username used to login.
                      public var login: String {
                        get {
                          return resultMap["login"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "login")
                        }
                      }
                    }
                  }
                }
              }
            }

            public var asDemilestonedEvent: AsDemilestonedEvent? {
              get {
                if !AsDemilestonedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDemilestonedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDemilestonedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DemilestonedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DemilestonedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asDisconnectedEvent: AsDisconnectedEvent? {
              get {
                if !AsDisconnectedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDisconnectedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDisconnectedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DisconnectedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DisconnectedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asIssueComment: AsIssueComment? {
              get {
                if !AsIssueComment.possibleTypes.contains(__typename) { return nil }
                return AsIssueComment(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsIssueComment: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["IssueComment"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("author", type: .object(Author.selections)),
                  GraphQLField("bodyText", type: .nonNull(.scalar(String.self))),
                  GraphQLField("bodyHTML", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("lastEditedAt", type: .scalar(String.self)),
                  GraphQLField("publishedAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, author: Author? = nil, bodyText: String, bodyHtml: String, url: String, lastEditedAt: String? = nil, publishedAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "IssueComment", "id": id, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "url": url, "lastEditedAt": lastEditedAt, "publishedAt": publishedAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The actor who authored the comment.
              public var author: Author? {
                get {
                  return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "author")
                }
              }

              /// The body rendered to text.
              public var bodyText: String {
                get {
                  return resultMap["bodyText"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "bodyText")
                }
              }

              /// The body rendered to HTML.
              public var bodyHtml: String {
                get {
                  return resultMap["bodyHTML"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "bodyHTML")
                }
              }

              /// The HTTP URL for this issue comment
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The moment the editor made the last edit
              public var lastEditedAt: String? {
                get {
                  return resultMap["lastEditedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "lastEditedAt")
                }
              }

              /// Identifies when the comment was published at.
              public var publishedAt: String? {
                get {
                  return resultMap["publishedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "publishedAt")
                }
              }

              public struct Author: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }
            }

            public var asLabeledEvent: AsLabeledEvent? {
              get {
                if !AsLabeledEvent.possibleTypes.contains(__typename) { return nil }
                return AsLabeledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsLabeledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LabeledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("label", type: .nonNull(.object(Label.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, label: Label) {
                self.init(unsafeResultMap: ["__typename": "LabeledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the label associated with the 'labeled' event.
              public var label: Label {
                get {
                  return Label(unsafeResultMap: resultMap["label"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "label")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Label: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Label"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("color", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(color: String, name: String) {
                  self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the label color.
                public var color: String {
                  get {
                    return resultMap["color"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }

                /// Identifies the label name.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public var asLockedEvent: AsLockedEvent? {
              get {
                if !AsLockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsLockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsLockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "LockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMarkedAsDuplicateEvent: AsMarkedAsDuplicateEvent? {
              get {
                if !AsMarkedAsDuplicateEvent.possibleTypes.contains(__typename) { return nil }
                return AsMarkedAsDuplicateEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMarkedAsDuplicateEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MarkedAsDuplicateEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MarkedAsDuplicateEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMentionedEvent: AsMentionedEvent? {
              get {
                if !AsMentionedEvent.possibleTypes.contains(__typename) { return nil }
                return AsMentionedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMentionedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MentionedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MentionedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMilestonedEvent: AsMilestonedEvent? {
              get {
                if !AsMilestonedEvent.possibleTypes.contains(__typename) { return nil }
                return AsMilestonedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMilestonedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MilestonedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("milestoneTitle", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, milestoneTitle: String) {
                self.init(unsafeResultMap: ["__typename": "MilestonedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "milestoneTitle": milestoneTitle])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the milestone title associated with the 'milestoned' event.
              public var milestoneTitle: String {
                get {
                  return resultMap["milestoneTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "milestoneTitle")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMovedColumnsInProjectEvent: AsMovedColumnsInProjectEvent? {
              get {
                if !AsMovedColumnsInProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsMovedColumnsInProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMovedColumnsInProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MovedColumnsInProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MovedColumnsInProjectEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asPinnedEvent: AsPinnedEvent? {
              get {
                if !AsPinnedEvent.possibleTypes.contains(__typename) { return nil }
                return AsPinnedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPinnedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PinnedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "PinnedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReferencedEvent: AsReferencedEvent? {
              get {
                if !AsReferencedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReferencedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReferencedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReferencedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("commit", alias: "nullableName", type: .object(NullableName.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, nullableName: NullableName? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReferencedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: NullableName) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the commit associated with the 'referenced' event.
              public var nullableName: NullableName? {
                get {
                  return (resultMap["nullableName"] as? ResultMap).flatMap { NullableName(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "nullableName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct NullableName: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("commitUrl", type: .nonNull(.scalar(String.self))),
                    GraphQLField("message", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(commitUrl: String, message: String, messageHeadline: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "commitUrl": commitUrl, "message": message, "messageHeadline": messageHeadline])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The HTTP URL for this Git object
                public var commitUrl: String {
                  get {
                    return resultMap["commitUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "commitUrl")
                  }
                }

                /// The Git commit message
                public var message: String {
                  get {
                    return resultMap["message"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "message")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }
              }
            }

            public var asRemovedFromProjectEvent: AsRemovedFromProjectEvent? {
              get {
                if !AsRemovedFromProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsRemovedFromProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsRemovedFromProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["RemovedFromProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "RemovedFromProjectEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asRenamedTitleEvent: AsRenamedTitleEvent? {
              get {
                if !AsRenamedTitleEvent.possibleTypes.contains(__typename) { return nil }
                return AsRenamedTitleEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsRenamedTitleEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["RenamedTitleEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("previousTitle", type: .nonNull(.scalar(String.self))),
                  GraphQLField("currentTitle", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, previousTitle: String, currentTitle: String) {
                self.init(unsafeResultMap: ["__typename": "RenamedTitleEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "previousTitle": previousTitle, "currentTitle": currentTitle])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the previous title of the issue or pull request.
              public var previousTitle: String {
                get {
                  return resultMap["previousTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "previousTitle")
                }
              }

              /// Identifies the current title of the issue or pull request.
              public var currentTitle: String {
                get {
                  return resultMap["currentTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currentTitle")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReopenedEvent: AsReopenedEvent? {
              get {
                if !AsReopenedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReopenedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReopenedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReopenedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReopenedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asSubscribedEvent: AsSubscribedEvent? {
              get {
                if !AsSubscribedEvent.possibleTypes.contains(__typename) { return nil }
                return AsSubscribedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsSubscribedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["SubscribedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "SubscribedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asTransferredEvent: AsTransferredEvent? {
              get {
                if !AsTransferredEvent.possibleTypes.contains(__typename) { return nil }
                return AsTransferredEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsTransferredEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["TransferredEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "TransferredEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnassignedEvent: AsUnassignedEvent? {
              get {
                if !AsUnassignedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnassignedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnassignedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnassignedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnassignedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnlabeledEvent: AsUnlabeledEvent? {
              get {
                if !AsUnlabeledEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnlabeledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnlabeledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnlabeledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("label", type: .nonNull(.object(Label.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, label: Label) {
                self.init(unsafeResultMap: ["__typename": "UnlabeledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the label associated with the 'unlabeled' event.
              public var label: Label {
                get {
                  return Label(unsafeResultMap: resultMap["label"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "label")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Label: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Label"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("color", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(color: String, name: String) {
                  self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the label color.
                public var color: String {
                  get {
                    return resultMap["color"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }

                /// Identifies the label name.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public var asUnlockedEvent: AsUnlockedEvent? {
              get {
                if !AsUnlockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnlockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnlockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnlockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnlockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnmarkedAsDuplicateEvent: AsUnmarkedAsDuplicateEvent? {
              get {
                if !AsUnmarkedAsDuplicateEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnmarkedAsDuplicateEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnmarkedAsDuplicateEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnmarkedAsDuplicateEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnmarkedAsDuplicateEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnpinnedEvent: AsUnpinnedEvent? {
              get {
                if !AsUnpinnedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnpinnedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnpinnedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnpinnedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnpinnedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnsubscribedEvent: AsUnsubscribedEvent? {
              get {
                if !AsUnsubscribedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnsubscribedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnsubscribedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnsubscribedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnsubscribedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUserBlockedEvent: AsUserBlockedEvent? {
              get {
                if !AsUserBlockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUserBlockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUserBlockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserBlockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("subject", type: .object(Subject.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, subject: Subject? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserBlockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "subject": subject.flatMap { (value: Subject) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// The user who was blocked.
              public var subject: Subject? {
                get {
                  return (resultMap["subject"] as? ResultMap).flatMap { Subject(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "subject")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Subject: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(login: String) {
                  self.init(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username used to login.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class PrInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query prInfo($owner: String!, $name: String!, $number: Int!, $after: String) {
      repository(owner: $owner, name: $name) {
        __typename
        nameWithOwner
        owner {
          __typename
          login
          avatarUrl
        }
        pullRequest(number: $number) {
          __typename
          title
          number
          author {
            __typename
            login
            avatarUrl
          }
          bodyText
          bodyHTML
          state
          baseRefName
          headRefName
          headRepositoryOwner {
            __typename
            login
            avatarUrl
          }
          baseRepository {
            __typename
            nameWithOwner
            owner {
              __typename
              login
            }
          }
          headRepository {
            __typename
            nameWithOwner
            owner {
              __typename
              login
            }
          }
          changedFiles
          additions
          deletions
          url
          commits {
            __typename
            totalCount
          }
          closed
          closedAt
          createdAt
          timelineItems(after: $after, first: 15) {
            __typename
            pageInfo {
              __typename
              endCursor
              startCursor
              hasNextPage
            }
            nodes {
              __typename
              ... on AddedToProjectEvent {
                id
                actor {
                  __typename
                  login
                  avatarUrl
                }
                createdAt
              }
              ... on AssignedEvent {
                id
                actor {
                  __typename
                  login
                  avatarUrl
                }
                assignee {
                  __typename
                  ... on User {
                    login
                  }
                  ... on Bot {
                    login
                  }
                  ... on Mannequin {
                    login
                  }
                  ... on Organization {
                    login
                  }
                }
              }
              ... on AutoMergeEnabledEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutoMergeDisabledEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutoMergeDisabledEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutoRebaseEnabledEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutoSquashEnabledEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutomaticBaseChangeFailedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on AutomaticBaseChangeSucceededEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on BaseRefChangedEvent {
                actor {
                  __typename
                  login
                }
                previousRefName
                currentRefName
              }
              ... on BaseRefDeletedEvent {
                actor {
                  __typename
                  login
                }
                baseRefName
              }
              ... on BaseRefForcePushedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ClosedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on CommentDeletedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ConnectedEvent {
                actor {
                  __typename
                  login
                }
                source {
                  __typename
                  ... on PullRequest {
                    repository {
                      __typename
                      nameWithOwner
                    }
                    number
                  }
                  ... on Issue {
                    repository {
                      __typename
                      nameWithOwner
                    }
                    number
                  }
                }
                subject {
                  __typename
                  ... on PullRequest {
                    repository {
                      __typename
                      nameWithOwner
                    }
                    number
                  }
                  ... on Issue {
                    repository {
                      __typename
                      nameWithOwner
                    }
                    number
                  }
                }
              }
              ... on ConvertToDraftEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ConvertedNoteToIssueEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on CrossReferencedEvent {
                actor {
                  __typename
                  login
                }
                target {
                  __typename
                  ... on Issue {
                    url
                    title
                    number
                    repository {
                      __typename
                      owner {
                        __typename
                        login
                      }
                      name
                    }
                  }
                  ... on PullRequest {
                    url
                    title
                    number
                    repository {
                      __typename
                      owner {
                        __typename
                        login
                      }
                      name
                    }
                  }
                }
              }
              ... on DemilestonedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on DeployedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on DeploymentEnvironmentChangedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on DisconnectedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on HeadRefDeletedEvent {
                actor {
                  __typename
                  login
                }
                headRefName
              }
              ... on HeadRefForcePushedEvent {
                actor {
                  __typename
                  login
                }
                beforeCommit {
                  __typename
                  messageHeadline
                  abbreviatedOid
                }
                afterCommit {
                  __typename
                  messageHeadline
                  abbreviatedOid
                }
                ref {
                  __typename
                  name
                }
              }
              ... on HeadRefRestoredEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on IssueComment {
                id
                author {
                  __typename
                  login
                  avatarUrl
                }
                bodyText
                bodyHTML
                url
                lastEditedAt
                publishedAt
              }
              ... on LabeledEvent {
                actor {
                  __typename
                  login
                }
                label {
                  __typename
                  color
                  name
                }
              }
              ... on LockedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MarkedAsDuplicateEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MentionedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on MergedEvent {
                actor {
                  __typename
                  login
                  avatarUrl
                }
                nullableName: commit {
                  __typename
                  abbreviatedOid
                  message
                  messageHeadline
                }
                mergeRefName
              }
              ... on MilestonedEvent {
                actor {
                  __typename
                  login
                }
                milestoneTitle
              }
              ... on MovedColumnsInProjectEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on PinnedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on PullRequestCommit {
                commit {
                  __typename
                  messageHeadline
                  author {
                    __typename
                    name
                    avatarUrl
                  }
                  abbreviatedOid
                  url
                }
                url
                resourcePath
              }
              ... on PullRequestCommitCommentThread {
                commit {
                  __typename
                  abbreviatedOid
                }
              }
              ... on PullRequestReview {
                author {
                  __typename
                  login
                  avatarUrl
                }
              }
              ... on PullRequestReviewThread {
                id
              }
              ... on PullRequestRevisionMarker {
                lastSeenCommit {
                  __typename
                  abbreviatedOid
                }
              }
              ... on ReadyForReviewEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ReferencedEvent {
                actor {
                  __typename
                  login
                }
                nullableName: commit {
                  __typename
                  commitUrl
                  message
                  messageHeadline
                }
              }
              ... on RemovedFromProjectEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on RenamedTitleEvent {
                actor {
                  __typename
                  login
                }
                previousTitle
                currentTitle
              }
              ... on ReopenedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ReviewDismissedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ReviewRequestRemovedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on ReviewRequestedEvent {
                actor {
                  __typename
                  login
                }
                requestedReviewer {
                  __typename
                  ... on User {
                    login
                  }
                  ... on Mannequin {
                    login
                  }
                  ... on Team {
                    name
                  }
                }
              }
              ... on SubscribedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on TransferredEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnassignedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnlabeledEvent {
                actor {
                  __typename
                  login
                }
                label {
                  __typename
                  color
                  name
                }
              }
              ... on UnlockedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnmarkedAsDuplicateEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnpinnedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UnsubscribedEvent {
                actor {
                  __typename
                  login
                }
              }
              ... on UserBlockedEvent {
                actor {
                  __typename
                  login
                }
                nullname: subject {
                  __typename
                  login
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "prInfo"

  public var owner: String
  public var name: String
  public var number: Int
  public var after: String?

  public init(owner: String, name: String, number: Int, after: String? = nil) {
    self.owner = owner
    self.name = name
    self.number = number
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["owner": owner, "name": name, "number": number, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("repository", arguments: ["owner": GraphQLVariable("owner"), "name": GraphQLVariable("name")], type: .object(Repository.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
          GraphQLField("pullRequest", arguments: ["number": GraphQLVariable("number")], type: .object(PullRequest.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nameWithOwner: String, owner: Owner, pullRequest: PullRequest? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner, "owner": owner.resultMap, "pullRequest": pullRequest.flatMap { (value: PullRequest) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The repository's name with owner.
      public var nameWithOwner: String {
        get {
          return resultMap["nameWithOwner"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nameWithOwner")
        }
      }

      /// The User owner of the repository.
      public var owner: Owner {
        get {
          return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "owner")
        }
      }

      /// Returns a single pull request from the current repository by number.
      public var pullRequest: PullRequest? {
        get {
          return (resultMap["pullRequest"] as? ResultMap).flatMap { PullRequest(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pullRequest")
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Organization", "User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("login", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeOrganization(login: String, avatarUrl: String) -> Owner {
          return Owner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
        }

        public static func makeUser(login: String, avatarUrl: String) -> Owner {
          return Owner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The username used to login.
        public var login: String {
          get {
            return resultMap["login"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "login")
          }
        }

        /// A URL pointing to the owner's public avatar.
        public var avatarUrl: String {
          get {
            return resultMap["avatarUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatarUrl")
          }
        }
      }

      public struct PullRequest: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PullRequest"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("number", type: .nonNull(.scalar(Int.self))),
            GraphQLField("author", type: .object(Author.selections)),
            GraphQLField("bodyText", type: .nonNull(.scalar(String.self))),
            GraphQLField("bodyHTML", type: .nonNull(.scalar(String.self))),
            GraphQLField("state", type: .nonNull(.scalar(PullRequestState.self))),
            GraphQLField("baseRefName", type: .nonNull(.scalar(String.self))),
            GraphQLField("headRefName", type: .nonNull(.scalar(String.self))),
            GraphQLField("headRepositoryOwner", type: .object(HeadRepositoryOwner.selections)),
            GraphQLField("baseRepository", type: .object(BaseRepository.selections)),
            GraphQLField("headRepository", type: .object(HeadRepository.selections)),
            GraphQLField("changedFiles", type: .nonNull(.scalar(Int.self))),
            GraphQLField("additions", type: .nonNull(.scalar(Int.self))),
            GraphQLField("deletions", type: .nonNull(.scalar(Int.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("commits", type: .nonNull(.object(Commit.selections))),
            GraphQLField("closed", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("closedAt", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("timelineItems", arguments: ["after": GraphQLVariable("after"), "first": 15], type: .nonNull(.object(TimelineItem.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, number: Int, author: Author? = nil, bodyText: String, bodyHtml: String, state: PullRequestState, baseRefName: String, headRefName: String, headRepositoryOwner: HeadRepositoryOwner? = nil, baseRepository: BaseRepository? = nil, headRepository: HeadRepository? = nil, changedFiles: Int, additions: Int, deletions: Int, url: String, commits: Commit, closed: Bool, closedAt: String? = nil, createdAt: String, timelineItems: TimelineItem) {
          self.init(unsafeResultMap: ["__typename": "PullRequest", "title": title, "number": number, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "state": state, "baseRefName": baseRefName, "headRefName": headRefName, "headRepositoryOwner": headRepositoryOwner.flatMap { (value: HeadRepositoryOwner) -> ResultMap in value.resultMap }, "baseRepository": baseRepository.flatMap { (value: BaseRepository) -> ResultMap in value.resultMap }, "headRepository": headRepository.flatMap { (value: HeadRepository) -> ResultMap in value.resultMap }, "changedFiles": changedFiles, "additions": additions, "deletions": deletions, "url": url, "commits": commits.resultMap, "closed": closed, "closedAt": closedAt, "createdAt": createdAt, "timelineItems": timelineItems.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the pull request title.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// Identifies the pull request number.
        public var number: Int {
          get {
            return resultMap["number"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "number")
          }
        }

        /// The actor who authored the comment.
        public var author: Author? {
          get {
            return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "author")
          }
        }

        /// The body rendered to text.
        public var bodyText: String {
          get {
            return resultMap["bodyText"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bodyText")
          }
        }

        /// The body rendered to HTML.
        public var bodyHtml: String {
          get {
            return resultMap["bodyHTML"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bodyHTML")
          }
        }

        /// Identifies the state of the pull request.
        public var state: PullRequestState {
          get {
            return resultMap["state"]! as! PullRequestState
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }

        /// Identifies the name of the base Ref associated with the pull request, even if the ref has been deleted.
        public var baseRefName: String {
          get {
            return resultMap["baseRefName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "baseRefName")
          }
        }

        /// Identifies the name of the head Ref associated with the pull request, even if the ref has been deleted.
        public var headRefName: String {
          get {
            return resultMap["headRefName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "headRefName")
          }
        }

        /// The owner of the repository associated with this pull request's head Ref.
        public var headRepositoryOwner: HeadRepositoryOwner? {
          get {
            return (resultMap["headRepositoryOwner"] as? ResultMap).flatMap { HeadRepositoryOwner(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "headRepositoryOwner")
          }
        }

        /// The repository associated with this pull request's base Ref.
        public var baseRepository: BaseRepository? {
          get {
            return (resultMap["baseRepository"] as? ResultMap).flatMap { BaseRepository(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "baseRepository")
          }
        }

        /// The repository associated with this pull request's head Ref.
        public var headRepository: HeadRepository? {
          get {
            return (resultMap["headRepository"] as? ResultMap).flatMap { HeadRepository(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "headRepository")
          }
        }

        /// The number of changed files in this pull request.
        public var changedFiles: Int {
          get {
            return resultMap["changedFiles"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "changedFiles")
          }
        }

        /// The number of additions in this pull request.
        public var additions: Int {
          get {
            return resultMap["additions"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "additions")
          }
        }

        /// The number of deletions in this pull request.
        public var deletions: Int {
          get {
            return resultMap["deletions"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "deletions")
          }
        }

        /// The HTTP URL for this pull request.
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// A list of commits present in this pull request's head branch not present in the base branch.
        public var commits: Commit {
          get {
            return Commit(unsafeResultMap: resultMap["commits"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "commits")
          }
        }

        /// `true` if the pull request is closed
        public var closed: Bool {
          get {
            return resultMap["closed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "closed")
          }
        }

        /// Identifies the date and time when the object was closed.
        public var closedAt: String? {
          get {
            return resultMap["closedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "closedAt")
          }
        }

        /// Identifies the date and time when the object was created.
        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// A list of events, comments, commits, etc. associated with the pull request.
        public var timelineItems: TimelineItem {
          get {
            return TimelineItem(unsafeResultMap: resultMap["timelineItems"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "timelineItems")
          }
        }

        public struct Author: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeBot(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeMannequin(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeOrganization(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeUser(login: String, avatarUrl: String) -> Author {
            return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The username of the actor.
          public var login: String {
            get {
              return resultMap["login"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "login")
            }
          }

          /// A URL pointing to the actor's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }
        }

        public struct HeadRepositoryOwner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeOrganization(login: String, avatarUrl: String) -> HeadRepositoryOwner {
            return HeadRepositoryOwner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
          }

          public static func makeUser(login: String, avatarUrl: String) -> HeadRepositoryOwner {
            return HeadRepositoryOwner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The username used to login.
          public var login: String {
            get {
              return resultMap["login"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "login")
            }
          }

          /// A URL pointing to the owner's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }
        }

        public struct BaseRepository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nameWithOwner: String, owner: Owner) {
            self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner, "owner": owner.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The repository's name with owner.
          public var nameWithOwner: String {
            get {
              return resultMap["nameWithOwner"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nameWithOwner")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "owner")
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeOrganization(login: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }
          }
        }

        public struct HeadRepository: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nameWithOwner: String, owner: Owner) {
            self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner, "owner": owner.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The repository's name with owner.
          public var nameWithOwner: String {
            get {
              return resultMap["nameWithOwner"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nameWithOwner")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "owner")
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Organization", "User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeOrganization(login: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Owner {
              return Owner(unsafeResultMap: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return resultMap["login"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "login")
              }
            }
          }
        }

        public struct Commit: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PullRequestCommitConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(totalCount: Int) {
            self.init(unsafeResultMap: ["__typename": "PullRequestCommitConnection", "totalCount": totalCount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the total count of items in the connection.
          public var totalCount: Int {
            get {
              return resultMap["totalCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalCount")
            }
          }
        }

        public struct TimelineItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PullRequestTimelineItemsConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "PullRequestTimelineItemsConnection", "pageInfo": pageInfo.resultMap, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Information to aid in pagination.
          public var pageInfo: PageInfo {
            get {
              return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
            }
          }

          /// A list of nodes.
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("endCursor", type: .scalar(String.self)),
                GraphQLField("startCursor", type: .scalar(String.self)),
                GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(endCursor: String? = nil, startCursor: String? = nil, hasNextPage: Bool) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "startCursor": startCursor, "hasNextPage": hasNextPage])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// When paginating forwards, the cursor to continue.
            public var endCursor: String? {
              get {
                return resultMap["endCursor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "endCursor")
              }
            }

            /// When paginating backwards, the cursor to continue.
            public var startCursor: String? {
              get {
                return resultMap["startCursor"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startCursor")
              }
            }

            /// When paginating forwards, are there more items?
            public var hasNextPage: Bool {
              get {
                return resultMap["hasNextPage"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "hasNextPage")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AddedToProjectEvent", "AssignedEvent", "AutoMergeDisabledEvent", "AutoMergeEnabledEvent", "AutoRebaseEnabledEvent", "AutoSquashEnabledEvent", "AutomaticBaseChangeFailedEvent", "AutomaticBaseChangeSucceededEvent", "BaseRefChangedEvent", "BaseRefDeletedEvent", "BaseRefForcePushedEvent", "ClosedEvent", "CommentDeletedEvent", "ConnectedEvent", "ConvertToDraftEvent", "ConvertedNoteToIssueEvent", "CrossReferencedEvent", "DemilestonedEvent", "DeployedEvent", "DeploymentEnvironmentChangedEvent", "DisconnectedEvent", "HeadRefDeletedEvent", "HeadRefForcePushedEvent", "HeadRefRestoredEvent", "IssueComment", "LabeledEvent", "LockedEvent", "MarkedAsDuplicateEvent", "MentionedEvent", "MergedEvent", "MilestonedEvent", "MovedColumnsInProjectEvent", "PinnedEvent", "PullRequestCommit", "PullRequestCommitCommentThread", "PullRequestReview", "PullRequestReviewThread", "PullRequestRevisionMarker", "ReadyForReviewEvent", "ReferencedEvent", "RemovedFromProjectEvent", "RenamedTitleEvent", "ReopenedEvent", "ReviewDismissedEvent", "ReviewRequestRemovedEvent", "ReviewRequestedEvent", "SubscribedEvent", "TransferredEvent", "UnassignedEvent", "UnlabeledEvent", "UnlockedEvent", "UnmarkedAsDuplicateEvent", "UnpinnedEvent", "UnsubscribedEvent", "UserBlockedEvent"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLTypeCase(
                  variants: ["AddedToProjectEvent": AsAddedToProjectEvent.selections, "AssignedEvent": AsAssignedEvent.selections, "AutoMergeEnabledEvent": AsAutoMergeEnabledEvent.selections, "AutoMergeDisabledEvent": AsAutoMergeDisabledEvent.selections, "AutoRebaseEnabledEvent": AsAutoRebaseEnabledEvent.selections, "AutoSquashEnabledEvent": AsAutoSquashEnabledEvent.selections, "AutomaticBaseChangeFailedEvent": AsAutomaticBaseChangeFailedEvent.selections, "AutomaticBaseChangeSucceededEvent": AsAutomaticBaseChangeSucceededEvent.selections, "BaseRefChangedEvent": AsBaseRefChangedEvent.selections, "BaseRefDeletedEvent": AsBaseRefDeletedEvent.selections, "BaseRefForcePushedEvent": AsBaseRefForcePushedEvent.selections, "ClosedEvent": AsClosedEvent.selections, "CommentDeletedEvent": AsCommentDeletedEvent.selections, "ConnectedEvent": AsConnectedEvent.selections, "ConvertToDraftEvent": AsConvertToDraftEvent.selections, "ConvertedNoteToIssueEvent": AsConvertedNoteToIssueEvent.selections, "CrossReferencedEvent": AsCrossReferencedEvent.selections, "DemilestonedEvent": AsDemilestonedEvent.selections, "DeployedEvent": AsDeployedEvent.selections, "DeploymentEnvironmentChangedEvent": AsDeploymentEnvironmentChangedEvent.selections, "DisconnectedEvent": AsDisconnectedEvent.selections, "HeadRefDeletedEvent": AsHeadRefDeletedEvent.selections, "HeadRefForcePushedEvent": AsHeadRefForcePushedEvent.selections, "HeadRefRestoredEvent": AsHeadRefRestoredEvent.selections, "IssueComment": AsIssueComment.selections, "LabeledEvent": AsLabeledEvent.selections, "LockedEvent": AsLockedEvent.selections, "MarkedAsDuplicateEvent": AsMarkedAsDuplicateEvent.selections, "MentionedEvent": AsMentionedEvent.selections, "MergedEvent": AsMergedEvent.selections, "MilestonedEvent": AsMilestonedEvent.selections, "MovedColumnsInProjectEvent": AsMovedColumnsInProjectEvent.selections, "PinnedEvent": AsPinnedEvent.selections, "PullRequestCommit": AsPullRequestCommit.selections, "PullRequestCommitCommentThread": AsPullRequestCommitCommentThread.selections, "PullRequestReview": AsPullRequestReview.selections, "PullRequestReviewThread": AsPullRequestReviewThread.selections, "PullRequestRevisionMarker": AsPullRequestRevisionMarker.selections, "ReadyForReviewEvent": AsReadyForReviewEvent.selections, "ReferencedEvent": AsReferencedEvent.selections, "RemovedFromProjectEvent": AsRemovedFromProjectEvent.selections, "RenamedTitleEvent": AsRenamedTitleEvent.selections, "ReopenedEvent": AsReopenedEvent.selections, "ReviewDismissedEvent": AsReviewDismissedEvent.selections, "ReviewRequestRemovedEvent": AsReviewRequestRemovedEvent.selections, "ReviewRequestedEvent": AsReviewRequestedEvent.selections, "SubscribedEvent": AsSubscribedEvent.selections, "TransferredEvent": AsTransferredEvent.selections, "UnassignedEvent": AsUnassignedEvent.selections, "UnlabeledEvent": AsUnlabeledEvent.selections, "UnlockedEvent": AsUnlockedEvent.selections, "UnmarkedAsDuplicateEvent": AsUnmarkedAsDuplicateEvent.selections, "UnpinnedEvent": AsUnpinnedEvent.selections, "UnsubscribedEvent": AsUnsubscribedEvent.selections, "UserBlockedEvent": AsUserBlockedEvent.selections],
                  default: [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                )
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeAddedToProjectEvent(id: GraphQLID, actor: AsAddedToProjectEvent.Actor? = nil, createdAt: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "AddedToProjectEvent", "id": id, "actor": actor.flatMap { (value: AsAddedToProjectEvent.Actor) -> ResultMap in value.resultMap }, "createdAt": createdAt])
            }

            public static func makeAssignedEvent(id: GraphQLID, actor: AsAssignedEvent.Actor? = nil, assignee: AsAssignedEvent.Assignee? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AssignedEvent", "id": id, "actor": actor.flatMap { (value: AsAssignedEvent.Actor) -> ResultMap in value.resultMap }, "assignee": assignee.flatMap { (value: AsAssignedEvent.Assignee) -> ResultMap in value.resultMap }])
            }

            public static func makeAutoMergeEnabledEvent(actor: AsAutoMergeEnabledEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutoMergeEnabledEvent", "actor": actor.flatMap { (value: AsAutoMergeEnabledEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeAutoMergeDisabledEvent(actor: AsAutoMergeDisabledEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutoMergeDisabledEvent", "actor": actor.flatMap { (value: AsAutoMergeDisabledEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeAutoRebaseEnabledEvent(actor: AsAutoRebaseEnabledEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutoRebaseEnabledEvent", "actor": actor.flatMap { (value: AsAutoRebaseEnabledEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeAutoSquashEnabledEvent(actor: AsAutoSquashEnabledEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutoSquashEnabledEvent", "actor": actor.flatMap { (value: AsAutoSquashEnabledEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeAutomaticBaseChangeFailedEvent(actor: AsAutomaticBaseChangeFailedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutomaticBaseChangeFailedEvent", "actor": actor.flatMap { (value: AsAutomaticBaseChangeFailedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeAutomaticBaseChangeSucceededEvent(actor: AsAutomaticBaseChangeSucceededEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "AutomaticBaseChangeSucceededEvent", "actor": actor.flatMap { (value: AsAutomaticBaseChangeSucceededEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeBaseRefChangedEvent(actor: AsBaseRefChangedEvent.Actor? = nil, previousRefName: String, currentRefName: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "BaseRefChangedEvent", "actor": actor.flatMap { (value: AsBaseRefChangedEvent.Actor) -> ResultMap in value.resultMap }, "previousRefName": previousRefName, "currentRefName": currentRefName])
            }

            public static func makeBaseRefDeletedEvent(actor: AsBaseRefDeletedEvent.Actor? = nil, baseRefName: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "BaseRefDeletedEvent", "actor": actor.flatMap { (value: AsBaseRefDeletedEvent.Actor) -> ResultMap in value.resultMap }, "baseRefName": baseRefName])
            }

            public static func makeBaseRefForcePushedEvent(actor: AsBaseRefForcePushedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "BaseRefForcePushedEvent", "actor": actor.flatMap { (value: AsBaseRefForcePushedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeClosedEvent(actor: AsClosedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ClosedEvent", "actor": actor.flatMap { (value: AsClosedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeCommentDeletedEvent(actor: AsCommentDeletedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "CommentDeletedEvent", "actor": actor.flatMap { (value: AsCommentDeletedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeConnectedEvent(actor: AsConnectedEvent.Actor? = nil, source: AsConnectedEvent.Source, subject: AsConnectedEvent.Subject) -> Node {
              return Node(unsafeResultMap: ["__typename": "ConnectedEvent", "actor": actor.flatMap { (value: AsConnectedEvent.Actor) -> ResultMap in value.resultMap }, "source": source.resultMap, "subject": subject.resultMap])
            }

            public static func makeConvertToDraftEvent(actor: AsConvertToDraftEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ConvertToDraftEvent", "actor": actor.flatMap { (value: AsConvertToDraftEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeConvertedNoteToIssueEvent(actor: AsConvertedNoteToIssueEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ConvertedNoteToIssueEvent", "actor": actor.flatMap { (value: AsConvertedNoteToIssueEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeCrossReferencedEvent(actor: AsCrossReferencedEvent.Actor? = nil, target: AsCrossReferencedEvent.Target) -> Node {
              return Node(unsafeResultMap: ["__typename": "CrossReferencedEvent", "actor": actor.flatMap { (value: AsCrossReferencedEvent.Actor) -> ResultMap in value.resultMap }, "target": target.resultMap])
            }

            public static func makeDemilestonedEvent(actor: AsDemilestonedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DemilestonedEvent", "actor": actor.flatMap { (value: AsDemilestonedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeDeployedEvent(actor: AsDeployedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DeployedEvent", "actor": actor.flatMap { (value: AsDeployedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeDeploymentEnvironmentChangedEvent(actor: AsDeploymentEnvironmentChangedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DeploymentEnvironmentChangedEvent", "actor": actor.flatMap { (value: AsDeploymentEnvironmentChangedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeDisconnectedEvent(actor: AsDisconnectedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "DisconnectedEvent", "actor": actor.flatMap { (value: AsDisconnectedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeHeadRefDeletedEvent(actor: AsHeadRefDeletedEvent.Actor? = nil, headRefName: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "HeadRefDeletedEvent", "actor": actor.flatMap { (value: AsHeadRefDeletedEvent.Actor) -> ResultMap in value.resultMap }, "headRefName": headRefName])
            }

            public static func makeHeadRefForcePushedEvent(actor: AsHeadRefForcePushedEvent.Actor? = nil, beforeCommit: AsHeadRefForcePushedEvent.BeforeCommit? = nil, afterCommit: AsHeadRefForcePushedEvent.AfterCommit? = nil, ref: AsHeadRefForcePushedEvent.Ref? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "HeadRefForcePushedEvent", "actor": actor.flatMap { (value: AsHeadRefForcePushedEvent.Actor) -> ResultMap in value.resultMap }, "beforeCommit": beforeCommit.flatMap { (value: AsHeadRefForcePushedEvent.BeforeCommit) -> ResultMap in value.resultMap }, "afterCommit": afterCommit.flatMap { (value: AsHeadRefForcePushedEvent.AfterCommit) -> ResultMap in value.resultMap }, "ref": ref.flatMap { (value: AsHeadRefForcePushedEvent.Ref) -> ResultMap in value.resultMap }])
            }

            public static func makeHeadRefRestoredEvent(actor: AsHeadRefRestoredEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "HeadRefRestoredEvent", "actor": actor.flatMap { (value: AsHeadRefRestoredEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeIssueComment(id: GraphQLID, author: AsIssueComment.Author? = nil, bodyText: String, bodyHtml: String, url: String, lastEditedAt: String? = nil, publishedAt: String? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "IssueComment", "id": id, "author": author.flatMap { (value: AsIssueComment.Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "url": url, "lastEditedAt": lastEditedAt, "publishedAt": publishedAt])
            }

            public static func makeLabeledEvent(actor: AsLabeledEvent.Actor? = nil, label: AsLabeledEvent.Label) -> Node {
              return Node(unsafeResultMap: ["__typename": "LabeledEvent", "actor": actor.flatMap { (value: AsLabeledEvent.Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
            }

            public static func makeLockedEvent(actor: AsLockedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "LockedEvent", "actor": actor.flatMap { (value: AsLockedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMarkedAsDuplicateEvent(actor: AsMarkedAsDuplicateEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MarkedAsDuplicateEvent", "actor": actor.flatMap { (value: AsMarkedAsDuplicateEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMentionedEvent(actor: AsMentionedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MentionedEvent", "actor": actor.flatMap { (value: AsMentionedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeMergedEvent(actor: AsMergedEvent.Actor? = nil, nullableName: AsMergedEvent.NullableName? = nil, mergeRefName: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "MergedEvent", "actor": actor.flatMap { (value: AsMergedEvent.Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: AsMergedEvent.NullableName) -> ResultMap in value.resultMap }, "mergeRefName": mergeRefName])
            }

            public static func makeMilestonedEvent(actor: AsMilestonedEvent.Actor? = nil, milestoneTitle: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "MilestonedEvent", "actor": actor.flatMap { (value: AsMilestonedEvent.Actor) -> ResultMap in value.resultMap }, "milestoneTitle": milestoneTitle])
            }

            public static func makeMovedColumnsInProjectEvent(actor: AsMovedColumnsInProjectEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "MovedColumnsInProjectEvent", "actor": actor.flatMap { (value: AsMovedColumnsInProjectEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makePinnedEvent(actor: AsPinnedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "PinnedEvent", "actor": actor.flatMap { (value: AsPinnedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makePullRequestCommit(commit: AsPullRequestCommit.Commit, url: String, resourcePath: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "PullRequestCommit", "commit": commit.resultMap, "url": url, "resourcePath": resourcePath])
            }

            public static func makePullRequestCommitCommentThread(commit: AsPullRequestCommitCommentThread.Commit) -> Node {
              return Node(unsafeResultMap: ["__typename": "PullRequestCommitCommentThread", "commit": commit.resultMap])
            }

            public static func makePullRequestReview(author: AsPullRequestReview.Author? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "PullRequestReview", "author": author.flatMap { (value: AsPullRequestReview.Author) -> ResultMap in value.resultMap }])
            }

            public static func makePullRequestReviewThread(id: GraphQLID) -> Node {
              return Node(unsafeResultMap: ["__typename": "PullRequestReviewThread", "id": id])
            }

            public static func makePullRequestRevisionMarker(lastSeenCommit: AsPullRequestRevisionMarker.LastSeenCommit) -> Node {
              return Node(unsafeResultMap: ["__typename": "PullRequestRevisionMarker", "lastSeenCommit": lastSeenCommit.resultMap])
            }

            public static func makeReadyForReviewEvent(actor: AsReadyForReviewEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReadyForReviewEvent", "actor": actor.flatMap { (value: AsReadyForReviewEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeReferencedEvent(actor: AsReferencedEvent.Actor? = nil, nullableName: AsReferencedEvent.NullableName? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReferencedEvent", "actor": actor.flatMap { (value: AsReferencedEvent.Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: AsReferencedEvent.NullableName) -> ResultMap in value.resultMap }])
            }

            public static func makeRemovedFromProjectEvent(actor: AsRemovedFromProjectEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "RemovedFromProjectEvent", "actor": actor.flatMap { (value: AsRemovedFromProjectEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeRenamedTitleEvent(actor: AsRenamedTitleEvent.Actor? = nil, previousTitle: String, currentTitle: String) -> Node {
              return Node(unsafeResultMap: ["__typename": "RenamedTitleEvent", "actor": actor.flatMap { (value: AsRenamedTitleEvent.Actor) -> ResultMap in value.resultMap }, "previousTitle": previousTitle, "currentTitle": currentTitle])
            }

            public static func makeReopenedEvent(actor: AsReopenedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReopenedEvent", "actor": actor.flatMap { (value: AsReopenedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeReviewDismissedEvent(actor: AsReviewDismissedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReviewDismissedEvent", "actor": actor.flatMap { (value: AsReviewDismissedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeReviewRequestRemovedEvent(actor: AsReviewRequestRemovedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReviewRequestRemovedEvent", "actor": actor.flatMap { (value: AsReviewRequestRemovedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeReviewRequestedEvent(actor: AsReviewRequestedEvent.Actor? = nil, requestedReviewer: AsReviewRequestedEvent.RequestedReviewer? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "ReviewRequestedEvent", "actor": actor.flatMap { (value: AsReviewRequestedEvent.Actor) -> ResultMap in value.resultMap }, "requestedReviewer": requestedReviewer.flatMap { (value: AsReviewRequestedEvent.RequestedReviewer) -> ResultMap in value.resultMap }])
            }

            public static func makeSubscribedEvent(actor: AsSubscribedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "SubscribedEvent", "actor": actor.flatMap { (value: AsSubscribedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeTransferredEvent(actor: AsTransferredEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "TransferredEvent", "actor": actor.flatMap { (value: AsTransferredEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnassignedEvent(actor: AsUnassignedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnassignedEvent", "actor": actor.flatMap { (value: AsUnassignedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnlabeledEvent(actor: AsUnlabeledEvent.Actor? = nil, label: AsUnlabeledEvent.Label) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnlabeledEvent", "actor": actor.flatMap { (value: AsUnlabeledEvent.Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
            }

            public static func makeUnlockedEvent(actor: AsUnlockedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnlockedEvent", "actor": actor.flatMap { (value: AsUnlockedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnmarkedAsDuplicateEvent(actor: AsUnmarkedAsDuplicateEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnmarkedAsDuplicateEvent", "actor": actor.flatMap { (value: AsUnmarkedAsDuplicateEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnpinnedEvent(actor: AsUnpinnedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnpinnedEvent", "actor": actor.flatMap { (value: AsUnpinnedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUnsubscribedEvent(actor: AsUnsubscribedEvent.Actor? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UnsubscribedEvent", "actor": actor.flatMap { (value: AsUnsubscribedEvent.Actor) -> ResultMap in value.resultMap }])
            }

            public static func makeUserBlockedEvent(actor: AsUserBlockedEvent.Actor? = nil, nullname: AsUserBlockedEvent.Nullname? = nil) -> Node {
              return Node(unsafeResultMap: ["__typename": "UserBlockedEvent", "actor": actor.flatMap { (value: AsUserBlockedEvent.Actor) -> ResultMap in value.resultMap }, "nullname": nullname.flatMap { (value: AsUserBlockedEvent.Nullname) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var asAddedToProjectEvent: AsAddedToProjectEvent? {
              get {
                if !AsAddedToProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsAddedToProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAddedToProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AddedToProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, actor: Actor? = nil, createdAt: String) {
                self.init(unsafeResultMap: ["__typename": "AddedToProjectEvent", "id": id, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "createdAt": createdAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the date and time when the object was created.
              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }
            }

            public var asAssignedEvent: AsAssignedEvent? {
              get {
                if !AsAssignedEvent.possibleTypes.contains(__typename) { return nil }
                return AsAssignedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAssignedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AssignedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("assignee", type: .object(Assignee.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, actor: Actor? = nil, assignee: Assignee? = nil) {
                self.init(unsafeResultMap: ["__typename": "AssignedEvent", "id": id, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "assignee": assignee.flatMap { (value: Assignee) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the user or mannequin that was assigned.
              public var assignee: Assignee? {
                get {
                  return (resultMap["assignee"] as? ResultMap).flatMap { Assignee(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "assignee")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }

              public struct Assignee: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["User": AsUser.selections, "Bot": AsBot.selections, "Mannequin": AsMannequin.selections, "Organization": AsOrganization.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeUser(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public static func makeBot(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeMannequin(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Assignee {
                  return Assignee(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asUser: AsUser? {
                  get {
                    if !AsUser.possibleTypes.contains(__typename) { return nil }
                    return AsUser(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsUser: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["User"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username used to login.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asBot: AsBot? {
                  get {
                    if !AsBot.possibleTypes.contains(__typename) { return nil }
                    return AsBot(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsBot: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Bot"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asMannequin: AsMannequin? {
                  get {
                    if !AsMannequin.possibleTypes.contains(__typename) { return nil }
                    return AsMannequin(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsMannequin: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Mannequin"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asOrganization: AsOrganization? {
                  get {
                    if !AsOrganization.possibleTypes.contains(__typename) { return nil }
                    return AsOrganization(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsOrganization: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Organization"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Organization", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The organization's login name.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }
            }

            public var asAutoMergeEnabledEvent: AsAutoMergeEnabledEvent? {
              get {
                if !AsAutoMergeEnabledEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutoMergeEnabledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutoMergeEnabledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutoMergeEnabledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutoMergeEnabledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asAutoMergeDisabledEvent: AsAutoMergeDisabledEvent? {
              get {
                if !AsAutoMergeDisabledEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutoMergeDisabledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutoMergeDisabledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutoMergeDisabledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutoMergeDisabledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asAutoRebaseEnabledEvent: AsAutoRebaseEnabledEvent? {
              get {
                if !AsAutoRebaseEnabledEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutoRebaseEnabledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutoRebaseEnabledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutoRebaseEnabledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutoRebaseEnabledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asAutoSquashEnabledEvent: AsAutoSquashEnabledEvent? {
              get {
                if !AsAutoSquashEnabledEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutoSquashEnabledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutoSquashEnabledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutoSquashEnabledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutoSquashEnabledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asAutomaticBaseChangeFailedEvent: AsAutomaticBaseChangeFailedEvent? {
              get {
                if !AsAutomaticBaseChangeFailedEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutomaticBaseChangeFailedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutomaticBaseChangeFailedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutomaticBaseChangeFailedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutomaticBaseChangeFailedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asAutomaticBaseChangeSucceededEvent: AsAutomaticBaseChangeSucceededEvent? {
              get {
                if !AsAutomaticBaseChangeSucceededEvent.possibleTypes.contains(__typename) { return nil }
                return AsAutomaticBaseChangeSucceededEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAutomaticBaseChangeSucceededEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AutomaticBaseChangeSucceededEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "AutomaticBaseChangeSucceededEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asBaseRefChangedEvent: AsBaseRefChangedEvent? {
              get {
                if !AsBaseRefChangedEvent.possibleTypes.contains(__typename) { return nil }
                return AsBaseRefChangedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsBaseRefChangedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["BaseRefChangedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("previousRefName", type: .nonNull(.scalar(String.self))),
                  GraphQLField("currentRefName", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, previousRefName: String, currentRefName: String) {
                self.init(unsafeResultMap: ["__typename": "BaseRefChangedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "previousRefName": previousRefName, "currentRefName": currentRefName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the name of the base ref for the pull request before it was changed.
              public var previousRefName: String {
                get {
                  return resultMap["previousRefName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "previousRefName")
                }
              }

              /// Identifies the name of the base ref for the pull request after it was changed.
              public var currentRefName: String {
                get {
                  return resultMap["currentRefName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currentRefName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asBaseRefDeletedEvent: AsBaseRefDeletedEvent? {
              get {
                if !AsBaseRefDeletedEvent.possibleTypes.contains(__typename) { return nil }
                return AsBaseRefDeletedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsBaseRefDeletedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["BaseRefDeletedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("baseRefName", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, baseRefName: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "BaseRefDeletedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "baseRefName": baseRefName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the name of the Ref associated with the `base_ref_deleted` event.
              public var baseRefName: String? {
                get {
                  return resultMap["baseRefName"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "baseRefName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asBaseRefForcePushedEvent: AsBaseRefForcePushedEvent? {
              get {
                if !AsBaseRefForcePushedEvent.possibleTypes.contains(__typename) { return nil }
                return AsBaseRefForcePushedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsBaseRefForcePushedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["BaseRefForcePushedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "BaseRefForcePushedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asClosedEvent: AsClosedEvent? {
              get {
                if !AsClosedEvent.possibleTypes.contains(__typename) { return nil }
                return AsClosedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsClosedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ClosedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ClosedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asCommentDeletedEvent: AsCommentDeletedEvent? {
              get {
                if !AsCommentDeletedEvent.possibleTypes.contains(__typename) { return nil }
                return AsCommentDeletedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsCommentDeletedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CommentDeletedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "CommentDeletedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asConnectedEvent: AsConnectedEvent? {
              get {
                if !AsConnectedEvent.possibleTypes.contains(__typename) { return nil }
                return AsConnectedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsConnectedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ConnectedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("source", type: .nonNull(.object(Source.selections))),
                  GraphQLField("subject", type: .nonNull(.object(Subject.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, source: Source, subject: Subject) {
                self.init(unsafeResultMap: ["__typename": "ConnectedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "source": source.resultMap, "subject": subject.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Issue or pull request that made the reference.
              public var source: Source {
                get {
                  return Source(unsafeResultMap: resultMap["source"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "source")
                }
              }

              /// Issue or pull request which was connected.
              public var subject: Subject {
                get {
                  return Subject(unsafeResultMap: resultMap["subject"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "subject")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Source: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Issue", "PullRequest"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["PullRequest": AsPullRequest.selections, "Issue": AsIssue.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makePullRequest(repository: AsPullRequest.Repository, number: Int) -> Source {
                  return Source(unsafeResultMap: ["__typename": "PullRequest", "repository": repository.resultMap, "number": number])
                }

                public static func makeIssue(repository: AsIssue.Repository, number: Int) -> Source {
                  return Source(unsafeResultMap: ["__typename": "Issue", "repository": repository.resultMap, "number": number])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asPullRequest: AsPullRequest? {
                  get {
                    if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                    return AsPullRequest(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsPullRequest: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["PullRequest"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(repository: Repository, number: Int) {
                    self.init(unsafeResultMap: ["__typename": "PullRequest", "repository": repository.resultMap, "number": number])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  /// Identifies the pull request number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(nameWithOwner: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The repository's name with owner.
                    public var nameWithOwner: String {
                      get {
                        return resultMap["nameWithOwner"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "nameWithOwner")
                      }
                    }
                  }
                }

                public var asIssue: AsIssue? {
                  get {
                    if !AsIssue.possibleTypes.contains(__typename) { return nil }
                    return AsIssue(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsIssue: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Issue"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(repository: Repository, number: Int) {
                    self.init(unsafeResultMap: ["__typename": "Issue", "repository": repository.resultMap, "number": number])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  /// Identifies the issue number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(nameWithOwner: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The repository's name with owner.
                    public var nameWithOwner: String {
                      get {
                        return resultMap["nameWithOwner"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "nameWithOwner")
                      }
                    }
                  }
                }
              }

              public struct Subject: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Issue", "PullRequest"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["PullRequest": AsPullRequest.selections, "Issue": AsIssue.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makePullRequest(repository: AsPullRequest.Repository, number: Int) -> Subject {
                  return Subject(unsafeResultMap: ["__typename": "PullRequest", "repository": repository.resultMap, "number": number])
                }

                public static func makeIssue(repository: AsIssue.Repository, number: Int) -> Subject {
                  return Subject(unsafeResultMap: ["__typename": "Issue", "repository": repository.resultMap, "number": number])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asPullRequest: AsPullRequest? {
                  get {
                    if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                    return AsPullRequest(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsPullRequest: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["PullRequest"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(repository: Repository, number: Int) {
                    self.init(unsafeResultMap: ["__typename": "PullRequest", "repository": repository.resultMap, "number": number])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  /// Identifies the pull request number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(nameWithOwner: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The repository's name with owner.
                    public var nameWithOwner: String {
                      get {
                        return resultMap["nameWithOwner"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "nameWithOwner")
                      }
                    }
                  }
                }

                public var asIssue: AsIssue? {
                  get {
                    if !AsIssue.possibleTypes.contains(__typename) { return nil }
                    return AsIssue(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsIssue: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Issue"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(repository: Repository, number: Int) {
                    self.init(unsafeResultMap: ["__typename": "Issue", "repository": repository.resultMap, "number": number])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  /// Identifies the issue number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(nameWithOwner: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "nameWithOwner": nameWithOwner])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The repository's name with owner.
                    public var nameWithOwner: String {
                      get {
                        return resultMap["nameWithOwner"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "nameWithOwner")
                      }
                    }
                  }
                }
              }
            }

            public var asConvertToDraftEvent: AsConvertToDraftEvent? {
              get {
                if !AsConvertToDraftEvent.possibleTypes.contains(__typename) { return nil }
                return AsConvertToDraftEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsConvertToDraftEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ConvertToDraftEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ConvertToDraftEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asConvertedNoteToIssueEvent: AsConvertedNoteToIssueEvent? {
              get {
                if !AsConvertedNoteToIssueEvent.possibleTypes.contains(__typename) { return nil }
                return AsConvertedNoteToIssueEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsConvertedNoteToIssueEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ConvertedNoteToIssueEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ConvertedNoteToIssueEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asCrossReferencedEvent: AsCrossReferencedEvent? {
              get {
                if !AsCrossReferencedEvent.possibleTypes.contains(__typename) { return nil }
                return AsCrossReferencedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsCrossReferencedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CrossReferencedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("target", type: .nonNull(.object(Target.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, target: Target) {
                self.init(unsafeResultMap: ["__typename": "CrossReferencedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "target": target.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Issue or pull request to which the reference was made.
              public var target: Target {
                get {
                  return Target(unsafeResultMap: resultMap["target"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "target")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Target: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Issue", "PullRequest"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["Issue": AsIssue.selections, "PullRequest": AsPullRequest.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeIssue(url: String, title: String, number: Int, repository: AsIssue.Repository) -> Target {
                  return Target(unsafeResultMap: ["__typename": "Issue", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                }

                public static func makePullRequest(url: String, title: String, number: Int, repository: AsPullRequest.Repository) -> Target {
                  return Target(unsafeResultMap: ["__typename": "PullRequest", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asIssue: AsIssue? {
                  get {
                    if !AsIssue.possibleTypes.contains(__typename) { return nil }
                    return AsIssue(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsIssue: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Issue"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("title", type: .nonNull(.scalar(String.self))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, title: String, number: Int, repository: Repository) {
                    self.init(unsafeResultMap: ["__typename": "Issue", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The HTTP URL for this issue
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// Identifies the issue title.
                  public var title: String {
                    get {
                      return resultMap["title"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the issue number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(owner: Owner, name: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "owner": owner.resultMap, "name": name])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The User owner of the repository.
                    public var owner: Owner {
                      get {
                        return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "owner")
                      }
                    }

                    /// The name of the repository.
                    public var name: String {
                      get {
                        return resultMap["name"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }

                    public struct Owner: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["Organization", "User"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("login", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public static func makeOrganization(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
                      }

                      public static func makeUser(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "User", "login": login])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username used to login.
                      public var login: String {
                        get {
                          return resultMap["login"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "login")
                        }
                      }
                    }
                  }
                }

                public var asPullRequest: AsPullRequest? {
                  get {
                    if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                    return AsPullRequest(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsPullRequest: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["PullRequest"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("title", type: .nonNull(.scalar(String.self))),
                      GraphQLField("number", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("repository", type: .nonNull(.object(Repository.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, title: String, number: Int, repository: Repository) {
                    self.init(unsafeResultMap: ["__typename": "PullRequest", "url": url, "title": title, "number": number, "repository": repository.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The HTTP URL for this pull request.
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// Identifies the pull request title.
                  public var title: String {
                    get {
                      return resultMap["title"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "title")
                    }
                  }

                  /// Identifies the pull request number.
                  public var number: Int {
                    get {
                      return resultMap["number"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "number")
                    }
                  }

                  /// The repository associated with this node.
                  public var repository: Repository {
                    get {
                      return Repository(unsafeResultMap: resultMap["repository"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "repository")
                    }
                  }

                  public struct Repository: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Repository"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(owner: Owner, name: String) {
                      self.init(unsafeResultMap: ["__typename": "Repository", "owner": owner.resultMap, "name": name])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The User owner of the repository.
                    public var owner: Owner {
                      get {
                        return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
                      }
                      set {
                        resultMap.updateValue(newValue.resultMap, forKey: "owner")
                      }
                    }

                    /// The name of the repository.
                    public var name: String {
                      get {
                        return resultMap["name"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }

                    public struct Owner: GraphQLSelectionSet {
                      public static let possibleTypes: [String] = ["Organization", "User"]

                      public static var selections: [GraphQLSelection] {
                        return [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("login", type: .nonNull(.scalar(String.self))),
                        ]
                      }

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public static func makeOrganization(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
                      }

                      public static func makeUser(login: String) -> Owner {
                        return Owner(unsafeResultMap: ["__typename": "User", "login": login])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username used to login.
                      public var login: String {
                        get {
                          return resultMap["login"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "login")
                        }
                      }
                    }
                  }
                }
              }
            }

            public var asDemilestonedEvent: AsDemilestonedEvent? {
              get {
                if !AsDemilestonedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDemilestonedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDemilestonedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DemilestonedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DemilestonedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asDeployedEvent: AsDeployedEvent? {
              get {
                if !AsDeployedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDeployedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDeployedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DeployedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DeployedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asDeploymentEnvironmentChangedEvent: AsDeploymentEnvironmentChangedEvent? {
              get {
                if !AsDeploymentEnvironmentChangedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDeploymentEnvironmentChangedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDeploymentEnvironmentChangedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DeploymentEnvironmentChangedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DeploymentEnvironmentChangedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asDisconnectedEvent: AsDisconnectedEvent? {
              get {
                if !AsDisconnectedEvent.possibleTypes.contains(__typename) { return nil }
                return AsDisconnectedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsDisconnectedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DisconnectedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "DisconnectedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asHeadRefDeletedEvent: AsHeadRefDeletedEvent? {
              get {
                if !AsHeadRefDeletedEvent.possibleTypes.contains(__typename) { return nil }
                return AsHeadRefDeletedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsHeadRefDeletedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["HeadRefDeletedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("headRefName", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, headRefName: String) {
                self.init(unsafeResultMap: ["__typename": "HeadRefDeletedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "headRefName": headRefName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the name of the Ref associated with the `head_ref_deleted` event.
              public var headRefName: String {
                get {
                  return resultMap["headRefName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "headRefName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asHeadRefForcePushedEvent: AsHeadRefForcePushedEvent? {
              get {
                if !AsHeadRefForcePushedEvent.possibleTypes.contains(__typename) { return nil }
                return AsHeadRefForcePushedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsHeadRefForcePushedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["HeadRefForcePushedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("beforeCommit", type: .object(BeforeCommit.selections)),
                  GraphQLField("afterCommit", type: .object(AfterCommit.selections)),
                  GraphQLField("ref", type: .object(Ref.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, beforeCommit: BeforeCommit? = nil, afterCommit: AfterCommit? = nil, ref: Ref? = nil) {
                self.init(unsafeResultMap: ["__typename": "HeadRefForcePushedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "beforeCommit": beforeCommit.flatMap { (value: BeforeCommit) -> ResultMap in value.resultMap }, "afterCommit": afterCommit.flatMap { (value: AfterCommit) -> ResultMap in value.resultMap }, "ref": ref.flatMap { (value: Ref) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the before commit SHA for the 'head_ref_force_pushed' event.
              public var beforeCommit: BeforeCommit? {
                get {
                  return (resultMap["beforeCommit"] as? ResultMap).flatMap { BeforeCommit(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "beforeCommit")
                }
              }

              /// Identifies the after commit SHA for the 'head_ref_force_pushed' event.
              public var afterCommit: AfterCommit? {
                get {
                  return (resultMap["afterCommit"] as? ResultMap).flatMap { AfterCommit(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "afterCommit")
                }
              }

              /// Identifies the fully qualified ref name for the 'head_ref_force_pushed' event.
              public var ref: Ref? {
                get {
                  return (resultMap["ref"] as? ResultMap).flatMap { Ref(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "ref")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct BeforeCommit: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(messageHeadline: String, abbreviatedOid: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "messageHeadline": messageHeadline, "abbreviatedOid": abbreviatedOid])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }
              }

              public struct AfterCommit: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(messageHeadline: String, abbreviatedOid: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "messageHeadline": messageHeadline, "abbreviatedOid": abbreviatedOid])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }
              }

              public struct Ref: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Ref"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String) {
                  self.init(unsafeResultMap: ["__typename": "Ref", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The ref name.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public var asHeadRefRestoredEvent: AsHeadRefRestoredEvent? {
              get {
                if !AsHeadRefRestoredEvent.possibleTypes.contains(__typename) { return nil }
                return AsHeadRefRestoredEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsHeadRefRestoredEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["HeadRefRestoredEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "HeadRefRestoredEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asIssueComment: AsIssueComment? {
              get {
                if !AsIssueComment.possibleTypes.contains(__typename) { return nil }
                return AsIssueComment(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsIssueComment: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["IssueComment"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("author", type: .object(Author.selections)),
                  GraphQLField("bodyText", type: .nonNull(.scalar(String.self))),
                  GraphQLField("bodyHTML", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("lastEditedAt", type: .scalar(String.self)),
                  GraphQLField("publishedAt", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, author: Author? = nil, bodyText: String, bodyHtml: String, url: String, lastEditedAt: String? = nil, publishedAt: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "IssueComment", "id": id, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "bodyText": bodyText, "bodyHTML": bodyHtml, "url": url, "lastEditedAt": lastEditedAt, "publishedAt": publishedAt])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The actor who authored the comment.
              public var author: Author? {
                get {
                  return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "author")
                }
              }

              /// The body rendered to text.
              public var bodyText: String {
                get {
                  return resultMap["bodyText"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "bodyText")
                }
              }

              /// The body rendered to HTML.
              public var bodyHtml: String {
                get {
                  return resultMap["bodyHTML"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "bodyHTML")
                }
              }

              /// The HTTP URL for this issue comment
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The moment the editor made the last edit
              public var lastEditedAt: String? {
                get {
                  return resultMap["lastEditedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "lastEditedAt")
                }
              }

              /// Identifies when the comment was published at.
              public var publishedAt: String? {
                get {
                  return resultMap["publishedAt"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "publishedAt")
                }
              }

              public struct Author: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }
            }

            public var asLabeledEvent: AsLabeledEvent? {
              get {
                if !AsLabeledEvent.possibleTypes.contains(__typename) { return nil }
                return AsLabeledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsLabeledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LabeledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("label", type: .nonNull(.object(Label.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, label: Label) {
                self.init(unsafeResultMap: ["__typename": "LabeledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the label associated with the 'labeled' event.
              public var label: Label {
                get {
                  return Label(unsafeResultMap: resultMap["label"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "label")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Label: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Label"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("color", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(color: String, name: String) {
                  self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the label color.
                public var color: String {
                  get {
                    return resultMap["color"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }

                /// Identifies the label name.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public var asLockedEvent: AsLockedEvent? {
              get {
                if !AsLockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsLockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsLockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["LockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "LockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMarkedAsDuplicateEvent: AsMarkedAsDuplicateEvent? {
              get {
                if !AsMarkedAsDuplicateEvent.possibleTypes.contains(__typename) { return nil }
                return AsMarkedAsDuplicateEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMarkedAsDuplicateEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MarkedAsDuplicateEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MarkedAsDuplicateEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMentionedEvent: AsMentionedEvent? {
              get {
                if !AsMentionedEvent.possibleTypes.contains(__typename) { return nil }
                return AsMentionedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMentionedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MentionedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MentionedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMergedEvent: AsMergedEvent? {
              get {
                if !AsMergedEvent.possibleTypes.contains(__typename) { return nil }
                return AsMergedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMergedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MergedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("commit", alias: "nullableName", type: .object(NullableName.selections)),
                  GraphQLField("mergeRefName", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, nullableName: NullableName? = nil, mergeRefName: String) {
                self.init(unsafeResultMap: ["__typename": "MergedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: NullableName) -> ResultMap in value.resultMap }, "mergeRefName": mergeRefName])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the commit associated with the `merge` event.
              public var nullableName: NullableName? {
                get {
                  return (resultMap["nullableName"] as? ResultMap).flatMap { NullableName(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "nullableName")
                }
              }

              /// Identifies the name of the Ref associated with the `merge` event.
              public var mergeRefName: String {
                get {
                  return resultMap["mergeRefName"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "mergeRefName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }

              public struct NullableName: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                    GraphQLField("message", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(abbreviatedOid: String, message: String, messageHeadline: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "abbreviatedOid": abbreviatedOid, "message": message, "messageHeadline": messageHeadline])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }

                /// The Git commit message
                public var message: String {
                  get {
                    return resultMap["message"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "message")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }
              }
            }

            public var asMilestonedEvent: AsMilestonedEvent? {
              get {
                if !AsMilestonedEvent.possibleTypes.contains(__typename) { return nil }
                return AsMilestonedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMilestonedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MilestonedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("milestoneTitle", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, milestoneTitle: String) {
                self.init(unsafeResultMap: ["__typename": "MilestonedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "milestoneTitle": milestoneTitle])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the milestone title associated with the 'milestoned' event.
              public var milestoneTitle: String {
                get {
                  return resultMap["milestoneTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "milestoneTitle")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asMovedColumnsInProjectEvent: AsMovedColumnsInProjectEvent? {
              get {
                if !AsMovedColumnsInProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsMovedColumnsInProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsMovedColumnsInProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MovedColumnsInProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "MovedColumnsInProjectEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asPinnedEvent: AsPinnedEvent? {
              get {
                if !AsPinnedEvent.possibleTypes.contains(__typename) { return nil }
                return AsPinnedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPinnedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PinnedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "PinnedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asPullRequestCommit: AsPullRequestCommit? {
              get {
                if !AsPullRequestCommit.possibleTypes.contains(__typename) { return nil }
                return AsPullRequestCommit(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPullRequestCommit: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PullRequestCommit"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("commit", type: .nonNull(.object(Commit.selections))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(commit: Commit, url: String, resourcePath: String) {
                self.init(unsafeResultMap: ["__typename": "PullRequestCommit", "commit": commit.resultMap, "url": url, "resourcePath": resourcePath])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The Git commit object
              public var commit: Commit {
                get {
                  return Commit(unsafeResultMap: resultMap["commit"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "commit")
                }
              }

              /// The HTTP URL for this pull request commit
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The HTTP path for this pull request commit
              public var resourcePath: String {
                get {
                  return resultMap["resourcePath"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "resourcePath")
                }
              }

              public struct Commit: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                    GraphQLField("author", type: .object(Author.selections)),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(messageHeadline: String, author: Author? = nil, abbreviatedOid: String, url: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "messageHeadline": messageHeadline, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "abbreviatedOid": abbreviatedOid, "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }

                /// Authorship details of the commit.
                public var author: Author? {
                  get {
                    return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "author")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }

                /// The HTTP URL for this commit
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["GitActor"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("name", type: .scalar(String.self)),
                      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String? = nil, avatarUrl: String) {
                    self.init(unsafeResultMap: ["__typename": "GitActor", "name": name, "avatarUrl": avatarUrl])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name in the Git commit.
                  public var name: String? {
                    get {
                      return resultMap["name"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// A URL pointing to the author's public avatar.
                  public var avatarUrl: String {
                    get {
                      return resultMap["avatarUrl"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "avatarUrl")
                    }
                  }
                }
              }
            }

            public var asPullRequestCommitCommentThread: AsPullRequestCommitCommentThread? {
              get {
                if !AsPullRequestCommitCommentThread.possibleTypes.contains(__typename) { return nil }
                return AsPullRequestCommitCommentThread(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPullRequestCommitCommentThread: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PullRequestCommitCommentThread"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("commit", type: .nonNull(.object(Commit.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(commit: Commit) {
                self.init(unsafeResultMap: ["__typename": "PullRequestCommitCommentThread", "commit": commit.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The commit the comments were made on.
              public var commit: Commit {
                get {
                  return Commit(unsafeResultMap: resultMap["commit"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "commit")
                }
              }

              public struct Commit: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(abbreviatedOid: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "abbreviatedOid": abbreviatedOid])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }
              }
            }

            public var asPullRequestReview: AsPullRequestReview? {
              get {
                if !AsPullRequestReview.possibleTypes.contains(__typename) { return nil }
                return AsPullRequestReview(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPullRequestReview: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PullRequestReview"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("author", type: .object(Author.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(author: Author? = nil) {
                self.init(unsafeResultMap: ["__typename": "PullRequestReview", "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The actor who authored the comment.
              public var author: Author? {
                get {
                  return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "author")
                }
              }

              public struct Author: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeMannequin(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeOrganization(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
                }

                public static func makeUser(login: String, avatarUrl: String) -> Author {
                  return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }
              }
            }

            public var asPullRequestReviewThread: AsPullRequestReviewThread? {
              get {
                if !AsPullRequestReviewThread.possibleTypes.contains(__typename) { return nil }
                return AsPullRequestReviewThread(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPullRequestReviewThread: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PullRequestReviewThread"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID) {
                self.init(unsafeResultMap: ["__typename": "PullRequestReviewThread", "id": id])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }
            }

            public var asPullRequestRevisionMarker: AsPullRequestRevisionMarker? {
              get {
                if !AsPullRequestRevisionMarker.possibleTypes.contains(__typename) { return nil }
                return AsPullRequestRevisionMarker(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsPullRequestRevisionMarker: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PullRequestRevisionMarker"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("lastSeenCommit", type: .nonNull(.object(LastSeenCommit.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(lastSeenCommit: LastSeenCommit) {
                self.init(unsafeResultMap: ["__typename": "PullRequestRevisionMarker", "lastSeenCommit": lastSeenCommit.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The last commit the viewer has seen.
              public var lastSeenCommit: LastSeenCommit {
                get {
                  return LastSeenCommit(unsafeResultMap: resultMap["lastSeenCommit"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "lastSeenCommit")
                }
              }

              public struct LastSeenCommit: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("abbreviatedOid", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(abbreviatedOid: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "abbreviatedOid": abbreviatedOid])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// An abbreviated version of the Git object ID
                public var abbreviatedOid: String {
                  get {
                    return resultMap["abbreviatedOid"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "abbreviatedOid")
                  }
                }
              }
            }

            public var asReadyForReviewEvent: AsReadyForReviewEvent? {
              get {
                if !AsReadyForReviewEvent.possibleTypes.contains(__typename) { return nil }
                return AsReadyForReviewEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReadyForReviewEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReadyForReviewEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReadyForReviewEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReferencedEvent: AsReferencedEvent? {
              get {
                if !AsReferencedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReferencedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReferencedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReferencedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("commit", alias: "nullableName", type: .object(NullableName.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, nullableName: NullableName? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReferencedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "nullableName": nullableName.flatMap { (value: NullableName) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the commit associated with the 'referenced' event.
              public var nullableName: NullableName? {
                get {
                  return (resultMap["nullableName"] as? ResultMap).flatMap { NullableName(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "nullableName")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct NullableName: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Commit"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("commitUrl", type: .nonNull(.scalar(String.self))),
                    GraphQLField("message", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(commitUrl: String, message: String, messageHeadline: String) {
                  self.init(unsafeResultMap: ["__typename": "Commit", "commitUrl": commitUrl, "message": message, "messageHeadline": messageHeadline])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The HTTP URL for this Git object
                public var commitUrl: String {
                  get {
                    return resultMap["commitUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "commitUrl")
                  }
                }

                /// The Git commit message
                public var message: String {
                  get {
                    return resultMap["message"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "message")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return resultMap["messageHeadline"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "messageHeadline")
                  }
                }
              }
            }

            public var asRemovedFromProjectEvent: AsRemovedFromProjectEvent? {
              get {
                if !AsRemovedFromProjectEvent.possibleTypes.contains(__typename) { return nil }
                return AsRemovedFromProjectEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsRemovedFromProjectEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["RemovedFromProjectEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "RemovedFromProjectEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asRenamedTitleEvent: AsRenamedTitleEvent? {
              get {
                if !AsRenamedTitleEvent.possibleTypes.contains(__typename) { return nil }
                return AsRenamedTitleEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsRenamedTitleEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["RenamedTitleEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("previousTitle", type: .nonNull(.scalar(String.self))),
                  GraphQLField("currentTitle", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, previousTitle: String, currentTitle: String) {
                self.init(unsafeResultMap: ["__typename": "RenamedTitleEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "previousTitle": previousTitle, "currentTitle": currentTitle])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the previous title of the issue or pull request.
              public var previousTitle: String {
                get {
                  return resultMap["previousTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "previousTitle")
                }
              }

              /// Identifies the current title of the issue or pull request.
              public var currentTitle: String {
                get {
                  return resultMap["currentTitle"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currentTitle")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReopenedEvent: AsReopenedEvent? {
              get {
                if !AsReopenedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReopenedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReopenedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReopenedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReopenedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReviewDismissedEvent: AsReviewDismissedEvent? {
              get {
                if !AsReviewDismissedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReviewDismissedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReviewDismissedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReviewDismissedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReviewDismissedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReviewRequestRemovedEvent: AsReviewRequestRemovedEvent? {
              get {
                if !AsReviewRequestRemovedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReviewRequestRemovedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReviewRequestRemovedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReviewRequestRemovedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReviewRequestRemovedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asReviewRequestedEvent: AsReviewRequestedEvent? {
              get {
                if !AsReviewRequestedEvent.possibleTypes.contains(__typename) { return nil }
                return AsReviewRequestedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsReviewRequestedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ReviewRequestedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("requestedReviewer", type: .object(RequestedReviewer.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, requestedReviewer: RequestedReviewer? = nil) {
                self.init(unsafeResultMap: ["__typename": "ReviewRequestedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "requestedReviewer": requestedReviewer.flatMap { (value: RequestedReviewer) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the reviewer whose review was requested.
              public var requestedReviewer: RequestedReviewer? {
                get {
                  return (resultMap["requestedReviewer"] as? ResultMap).flatMap { RequestedReviewer(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "requestedReviewer")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct RequestedReviewer: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Mannequin", "Team", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLTypeCase(
                      variants: ["User": AsUser.selections, "Mannequin": AsMannequin.selections, "Team": AsTeam.selections],
                      default: [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      ]
                    )
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeUser(login: String) -> RequestedReviewer {
                  return RequestedReviewer(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public static func makeMannequin(login: String) -> RequestedReviewer {
                  return RequestedReviewer(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeTeam(name: String) -> RequestedReviewer {
                  return RequestedReviewer(unsafeResultMap: ["__typename": "Team", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var asUser: AsUser? {
                  get {
                    if !AsUser.possibleTypes.contains(__typename) { return nil }
                    return AsUser(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsUser: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["User"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username used to login.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asMannequin: AsMannequin? {
                  get {
                    if !AsMannequin.possibleTypes.contains(__typename) { return nil }
                    return AsMannequin(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsMannequin: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Mannequin"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public var asTeam: AsTeam? {
                  get {
                    if !AsTeam.possibleTypes.contains(__typename) { return nil }
                    return AsTeam(unsafeResultMap: resultMap)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    resultMap = newValue.resultMap
                  }
                }

                public struct AsTeam: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Team"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String) {
                    self.init(unsafeResultMap: ["__typename": "Team", "name": name])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name of the team.
                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }
            }

            public var asSubscribedEvent: AsSubscribedEvent? {
              get {
                if !AsSubscribedEvent.possibleTypes.contains(__typename) { return nil }
                return AsSubscribedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsSubscribedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["SubscribedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "SubscribedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asTransferredEvent: AsTransferredEvent? {
              get {
                if !AsTransferredEvent.possibleTypes.contains(__typename) { return nil }
                return AsTransferredEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsTransferredEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["TransferredEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "TransferredEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnassignedEvent: AsUnassignedEvent? {
              get {
                if !AsUnassignedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnassignedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnassignedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnassignedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnassignedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnlabeledEvent: AsUnlabeledEvent? {
              get {
                if !AsUnlabeledEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnlabeledEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnlabeledEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnlabeledEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("label", type: .nonNull(.object(Label.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, label: Label) {
                self.init(unsafeResultMap: ["__typename": "UnlabeledEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "label": label.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// Identifies the label associated with the 'unlabeled' event.
              public var label: Label {
                get {
                  return Label(unsafeResultMap: resultMap["label"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "label")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Label: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Label"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("color", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(color: String, name: String) {
                  self.init(unsafeResultMap: ["__typename": "Label", "color": color, "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the label color.
                public var color: String {
                  get {
                    return resultMap["color"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "color")
                  }
                }

                /// Identifies the label name.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }

            public var asUnlockedEvent: AsUnlockedEvent? {
              get {
                if !AsUnlockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnlockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnlockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnlockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnlockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnmarkedAsDuplicateEvent: AsUnmarkedAsDuplicateEvent? {
              get {
                if !AsUnmarkedAsDuplicateEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnmarkedAsDuplicateEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnmarkedAsDuplicateEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnmarkedAsDuplicateEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnmarkedAsDuplicateEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnpinnedEvent: AsUnpinnedEvent? {
              get {
                if !AsUnpinnedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnpinnedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnpinnedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnpinnedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnpinnedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUnsubscribedEvent: AsUnsubscribedEvent? {
              get {
                if !AsUnsubscribedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUnsubscribedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUnsubscribedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UnsubscribedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil) {
                self.init(unsafeResultMap: ["__typename": "UnsubscribedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }

            public var asUserBlockedEvent: AsUserBlockedEvent? {
              get {
                if !AsUserBlockedEvent.possibleTypes.contains(__typename) { return nil }
                return AsUserBlockedEvent(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsUserBlockedEvent: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserBlockedEvent"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("actor", type: .object(Actor.selections)),
                  GraphQLField("subject", alias: "nullname", type: .object(Nullname.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(actor: Actor? = nil, nullname: Nullname? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserBlockedEvent", "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "nullname": nullname.flatMap { (value: Nullname) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the actor who performed the event.
              public var actor: Actor? {
                get {
                  return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "actor")
                }
              }

              /// The user who was blocked.
              public var nullname: Nullname? {
                get {
                  return (resultMap["nullname"] as? ResultMap).flatMap { Nullname(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "nullname")
                }
              }

              public struct Actor: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Bot", "EnterpriseUserAccount", "Mannequin", "Organization", "User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeBot(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Bot", "login": login])
                }

                public static func makeEnterpriseUserAccount(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
                }

                public static func makeMannequin(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Mannequin", "login": login])
                }

                public static func makeOrganization(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "Organization", "login": login])
                }

                public static func makeUser(login: String) -> Actor {
                  return Actor(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }

              public struct Nullname: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["User"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(login: String) {
                  self.init(unsafeResultMap: ["__typename": "User", "login": login])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username used to login.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
