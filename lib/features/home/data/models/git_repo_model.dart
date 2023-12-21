import 'dart:convert';

import 'package:floor/floor.dart';

import '../../domain/entities/git_repo_entity.dart';

class GitRepoModel {
  final int? totalCount;
  final bool? incompleteResults;
  final List<GitRepoDataModel>? items;

  GitRepoModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  GitRepoEntity toEntity() =>
      GitRepoEntity(
        totalCount: totalCount,
        incompleteResults: incompleteResults,
        items: items == null ? [] : List<GitRepoDataEntity>.from(items!.map((x) => x.toEntity())),
      );

  factory GitRepoModel.fromRawJson(String str) => GitRepoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GitRepoModel.fromJson(Map<String, dynamic> json) => GitRepoModel(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? [] : List<GitRepoDataModel>.from(json["items"]!.map((x) => GitRepoDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class GitRepoDataModel {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final OwnerModel? owner;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  final String? issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
  final String? deploymentsUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final bool? hasDiscussions;
  final int? forksCount;
  final dynamic mirrorUrl;
  final bool? archived;
  final bool? disabled;
  final int? openIssuesCount;
  final LicenseModel? license;
  final bool? allowForking;
  final bool? isTemplate;
  final bool? webCommitSignoffRequired;
  final List<String>? topics;
  final String? visibility;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final String? defaultBranch;
  final double? score;

  GitRepoDataModel({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  GitRepoDataEntity toEntity() =>
      GitRepoDataEntity(
        id: id,
        nodeId: nodeId,
        name: name,
        fullName: fullName,
        private: private,
        owner: owner!.toEntity(),
        htmlUrl: htmlUrl,
        description: description,
        fork: fork,
        url: url,
        forksUrl: forksUrl,
        keysUrl: keysUrl,
        collaboratorsUrl: collaboratorsUrl,
        teamsUrl: teamsUrl,
        hooksUrl: hooksUrl,
        issueEventsUrl: issueEventsUrl,
        eventsUrl: eventsUrl,
        assigneesUrl: assigneesUrl,
        branchesUrl: branchesUrl,
        tagsUrl: tagsUrl,
        blobsUrl: blobsUrl,
        gitTagsUrl: gitTagsUrl,
        gitRefsUrl: gitRefsUrl,
        treesUrl: treesUrl,
        statusesUrl: statusesUrl,
        languagesUrl: languagesUrl,
        stargazersUrl: stargazersUrl,
        contributorsUrl: contributorsUrl,
        subscribersUrl: subscribersUrl,
        subscriptionUrl: subscriptionUrl,
        commitsUrl: commitsUrl,
        gitCommitsUrl: gitCommitsUrl,
        commentsUrl: commentsUrl,
        issueCommentUrl: issueCommentUrl,
        contentsUrl: contentsUrl,
        compareUrl: compareUrl,
        mergesUrl: mergesUrl,
        archiveUrl: archiveUrl,
        downloadsUrl: downloadsUrl,
        issuesUrl: issuesUrl,
        pullsUrl: pullsUrl,
        milestonesUrl: milestonesUrl,
        notificationsUrl: notificationsUrl,
        labelsUrl: labelsUrl,
        releasesUrl: releasesUrl,
        deploymentsUrl: deploymentsUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
        pushedAt: pushedAt,
        gitUrl: gitUrl,
        sshUrl: sshUrl,
        cloneUrl: cloneUrl,
        svnUrl: svnUrl,
        homepage: homepage,
        size: size,
        stargazersCount: stargazersCount,
        watchersCount: watchersCount,
        language: language,
        hasIssues: hasIssues,
        hasProjects: hasProjects,
        hasDownloads: hasDownloads,
        hasWiki: hasWiki,
        hasPages: hasPages,
        hasDiscussions: hasDiscussions,
        forksCount: forksCount,
        mirrorUrl: mirrorUrl,
        archived: archived,
        disabled: disabled,
        openIssuesCount: openIssuesCount,
        license: license == null ? null : license!.toEntity(),
        allowForking: allowForking,
        isTemplate: isTemplate,
        webCommitSignoffRequired: webCommitSignoffRequired,
        topics: topics,
        visibility: visibility,
        forks: forks,
        openIssues: openIssues,
        watchers: watchers,
        defaultBranch: defaultBranch,
        score: score,
      );

  factory GitRepoDataModel.fromRawJson(String str) => GitRepoDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GitRepoDataModel.fromJson(Map<String, dynamic> json) => GitRepoDataModel(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: json["owner"] == null ? null : OwnerModel.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    fork: json["fork"],
    url: json["url"],
    forksUrl: json["forks_url"],
    keysUrl: json["keys_url"],
    collaboratorsUrl: json["collaborators_url"],
    teamsUrl: json["teams_url"],
    hooksUrl: json["hooks_url"],
    issueEventsUrl: json["issue_events_url"],
    eventsUrl: json["events_url"],
    assigneesUrl: json["assignees_url"],
    branchesUrl: json["branches_url"],
    tagsUrl: json["tags_url"],
    blobsUrl: json["blobs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"],
    treesUrl: json["trees_url"],
    statusesUrl: json["statuses_url"],
    languagesUrl: json["languages_url"],
    stargazersUrl: json["stargazers_url"],
    contributorsUrl: json["contributors_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    commitsUrl: json["commits_url"],
    gitCommitsUrl: json["git_commits_url"],
    commentsUrl: json["comments_url"],
    issueCommentUrl: json["issue_comment_url"],
    contentsUrl: json["contents_url"],
    compareUrl: json["compare_url"],
    mergesUrl: json["merges_url"],
    archiveUrl: json["archive_url"],
    downloadsUrl: json["downloads_url"],
    issuesUrl: json["issues_url"],
    pullsUrl: json["pulls_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    labelsUrl: json["labels_url"],
    releasesUrl: json["releases_url"],
    deploymentsUrl: json["deployments_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pushedAt: json["pushed_at"] == null ? null : DateTime.parse(json["pushed_at"]),
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"],
    size: json["size"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    language: json["language"],
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasDownloads: json["has_downloads"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    hasDiscussions: json["has_discussions"],
    forksCount: json["forks_count"],
    mirrorUrl: json["mirror_url"],
    archived: json["archived"],
    disabled: json["disabled"],
    openIssuesCount: json["open_issues_count"],
    license: json["license"] == null ? null : LicenseModel.fromJson(json["license"]),
    allowForking: json["allow_forking"],
    isTemplate: json["is_template"],
    webCommitSignoffRequired: json["web_commit_signoff_required"],
    topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
    visibility: json["visibility"],
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
    defaultBranch: json["default_branch"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner?.toJson(),
    "html_url": htmlUrl,
    "description": description,
    "fork": fork,
    "url": url,
    "forks_url": forksUrl,
    "keys_url": keysUrl,
    "collaborators_url": collaboratorsUrl,
    "teams_url": teamsUrl,
    "hooks_url": hooksUrl,
    "issue_events_url": issueEventsUrl,
    "events_url": eventsUrl,
    "assignees_url": assigneesUrl,
    "branches_url": branchesUrl,
    "tags_url": tagsUrl,
    "blobs_url": blobsUrl,
    "git_tags_url": gitTagsUrl,
    "git_refs_url": gitRefsUrl,
    "trees_url": treesUrl,
    "statuses_url": statusesUrl,
    "languages_url": languagesUrl,
    "stargazers_url": stargazersUrl,
    "contributors_url": contributorsUrl,
    "subscribers_url": subscribersUrl,
    "subscription_url": subscriptionUrl,
    "commits_url": commitsUrl,
    "git_commits_url": gitCommitsUrl,
    "comments_url": commentsUrl,
    "issue_comment_url": issueCommentUrl,
    "contents_url": contentsUrl,
    "compare_url": compareUrl,
    "merges_url": mergesUrl,
    "archive_url": archiveUrl,
    "downloads_url": downloadsUrl,
    "issues_url": issuesUrl,
    "pulls_url": pullsUrl,
    "milestones_url": milestonesUrl,
    "notifications_url": notificationsUrl,
    "labels_url": labelsUrl,
    "releases_url": releasesUrl,
    "deployments_url": deploymentsUrl,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pushed_at": pushedAt?.toIso8601String(),
    "git_url": gitUrl,
    "ssh_url": sshUrl,
    "clone_url": cloneUrl,
    "svn_url": svnUrl,
    "homepage": homepage,
    "size": size,
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
    "language": language,
    "has_issues": hasIssues,
    "has_projects": hasProjects,
    "has_downloads": hasDownloads,
    "has_wiki": hasWiki,
    "has_pages": hasPages,
    "has_discussions": hasDiscussions,
    "forks_count": forksCount,
    "mirror_url": mirrorUrl,
    "archived": archived,
    "disabled": disabled,
    "open_issues_count": openIssuesCount,
    "license": license?.toJson(),
    "allow_forking": allowForking,
    "is_template": isTemplate,
    "web_commit_signoff_required": webCommitSignoffRequired,
    "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
    "visibility": visibility,
    "forks": forks,
    "open_issues": openIssues,
    "watchers": watchers,
    "default_branch": defaultBranch,
    "score": score,
  };
}

class LicenseModel {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  LicenseModel({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  LicenseEntity toEntity() =>
      LicenseEntity(
        key: key,
        name: name,
        spdxId: spdxId,
        url: url,
        nodeId: nodeId,
      );

  factory LicenseModel.fromRawJson(String str) => LicenseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LicenseModel.fromJson(Map<String, dynamic> json) => LicenseModel(
    key: json["key"],
    name: json["name"],
    spdxId: json["spdx_id"],
    url: json["url"],
    nodeId: json["node_id"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "spdx_id": spdxId,
    "url": url,
    "node_id": nodeId,
  };
}

class OwnerModel {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  OwnerModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  OwnerEntity toEntity() =>
      OwnerEntity(
        login: login,
        id: id,
        nodeId: nodeId,
        avatarUrl: avatarUrl,
        gravatarId: gravatarId,
        url: url,
        htmlUrl: htmlUrl,
        followersUrl: followersUrl,
        followingUrl: followingUrl,
        gistsUrl: gistsUrl,
        starredUrl: starredUrl,
        subscriptionsUrl: subscriptionsUrl,
        organizationsUrl: organizationsUrl,
        reposUrl: reposUrl,
        eventsUrl: eventsUrl,
        receivedEventsUrl: receivedEventsUrl,
        type: type,
        siteAdmin: siteAdmin,
      );

  factory OwnerModel.fromRawJson(String str) => OwnerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OwnerModel.fromJson(Map<String, dynamic> json) => OwnerModel(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "site_admin": siteAdmin,
  };
}