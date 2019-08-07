//
//  TrendingResponseParser.swift
//  GitTrending
//
//  Created by Bala Vino on 13/07/19.
//  Copyright © 2019 tarento. All rights reserved.
//

import Foundation
import SwiftSoup

func parseTrendingResponse(_ content: String?, type: TrendingType = .repositories) -> Trending? {
    guard let content = content else {
        return nil
    }
    
    do {
        let doc: Document = try SwiftSoup.parse(content)
        let languageElements = try doc.getElementsByClass("select-menu-item ")
        let languages = try getLanguages(from: languageElements)
        
        var trending = Trending(languages: languages)
        if type == .developers {
            let developerElements = try doc.getElementsByAttributeValueContaining("class", "Box-row")
            trending.developers = try getDevelopers(from: developerElements)
        }
        else {
            let repoElements = try doc.getElementsByTag("article")
            trending.repositories = try getRepositories(from: repoElements)
        }
        return trending
    }
    catch Exception.Error(_, let message) {
        print("ErrorMessage :- \(message)")
    }
    catch {
        print("error :- \(error.localizedDescription)")
    }
    return nil
}

private func getLanguages(from elements: Elements) throws -> [Language] {
    var languageList = [Language]()
    for element in elements.array() {
        let displayName = try element.text()
        let name = displayName.lowercased().replacingOccurrences(of: " ", with: "-")
        languageList.append(Language(name: name, displayName: displayName))
    }
    return languageList
}

private func getRepositories(from elements: Elements) throws -> [TrendingRepository] {
    var repoList = [TrendingRepository]()
    
    for element in elements.array() {
        let title = try element.getElementsByAttributeValueContaining("class", "h3").text()
        let repoDesc = try element.getElementsByTag("p").text()
        let repoPath = "/" + title.replacingOccurrences(of: " ", with: "")
        let repo = PopularRepo(title: title, description: repoDesc, path: repoPath)
        
        let language = try element.getElementsByAttributeValueContaining("itemprop", "programmingLanguage").text()
        let languageColor = try element.getElementsByAttributeValueContaining("class", "repo-language-color").attr("style")
        
        let stargazersPath = "\(repoPath)/stargazers"
        let totalStar = try element.getElementsByAttributeValueContaining("href", stargazersPath).text()
        let todayStar = try element.getElementsByAttributeValueContaining("class", "float-sm-right").text()
        let starDetails = TrendingRepoStarDetails(totalStars: totalStar, todayStar: todayStar, stargazersPath: stargazersPath)
        
        let forkMembersPath = "\(repoPath)/network/members)"
        let totalFork = try element.getElementsByAttributeValueContaining("href", forkMembersPath).text()
        let forkDetails = TrendingRepoForkDetails(totalFork: totalFork, membersPath: forkMembersPath)
        
        let buildByElement = try element.getElementsByAttributeValueContaining("data-hovercard-type", "user")
        let buildByMembers = try getRepositoryBuiltByMembers(from: buildByElement)
        
        let repository = TrendingRepository (repo: repo, language: language, languageColor: languageColor, stars: starDetails, fork: forkDetails, builtBy: buildByMembers)
        repoList.append(repository)
    }
    return repoList
}

private func getRepositoryBuiltByMembers(from elements: Elements) throws -> [TrendingRepoMember] {
    var memberList = [TrendingRepoMember]()
    
    for element in elements.array() {
        let profilePath = try element.attr("href")
        let profileImagePath = try element.getElementsByAttributeValueContaining("class", "avatar").attr("src")
        let hovercardUrlPath = try element.attr("data-hovercard-url")
        let repoMember = TrendingRepoMember(profilePath: profilePath, profileImagePath: profileImagePath, hovercardUrlPath: hovercardUrlPath)
        memberList.append(repoMember)
    }
    return memberList
}

private func getDevelopers(from elements: Elements) throws -> [TrendingDevelopers] {
    var developerList = [TrendingDevelopers]()
    
    for element in elements.array() {
        let name = try element.getElementsByAttributeValueContaining("class", "h3").text()
        let userName = try element.getElementsByAttributeValueContaining("class", "f4").text()
        let profilePath = "/\(userName)"
        let profileImagePath = try element.getElementsByTag("img").attr("src")
        
        let repoName = try element.getElementsByAttributeValueContaining("class", "h4").text()
        let repoDesc = try element.getElementsByAttributeValueContaining("class", "f6").text()
        let repoPath = try element.getElementsByAttributeValueContaining("href", profilePath).attr("href")
        let popularRepo = PopularRepo(title: repoName, description: repoDesc, path: repoPath)
        
        let developer = TrendingDevelopers(name: name,
                                           userName: userName,
                                           profilePath: profilePath,
                                           prifleImagePath: profileImagePath, popularRepo: popularRepo)
        developerList.append(developer)
    }
    return developerList
}

