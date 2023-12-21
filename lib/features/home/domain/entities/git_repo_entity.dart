import 'package:equatable/equatable.dart';

import '../../data/models/git_repo_model.dart';

class GitRepoEntity extends Equatable {
  final int? totalCount;
  final bool? incompleteResults;
  final List<GitRepoDataEntity>? items;

  const GitRepoEntity({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  GitRepoModel toModel() =>
      GitRepoModel(
        totalCount: totalCount,
        incompleteResults: incompleteResults,
        items: items == null ? [] : List<GitRepoDataModel>.from(items!.map((x) => x.toModel())),
      );

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}

class GitRepoDataEntity extends Equatable {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final OwnerEntity? owner;
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
  final LicenseEntity? license;
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

  const GitRepoDataEntity({
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

  GitRepoDataModel toModel() =>
      GitRepoDataModel(
        id: id,
        nodeId: nodeId,
        name: name,
        fullName: fullName,
        private: private,
        owner: owner!.toModel(),
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
        license: license == null ? null : license!.toModel(),
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

  @override
  List<Object?> get props => [
    id,
    nodeId,
    name,
    fullName,
    private,
    owner,
    htmlUrl,
    description,
    fork,
    url,
    forksUrl,
    keysUrl,
    collaboratorsUrl,
    teamsUrl,
    hooksUrl,
    issueEventsUrl,
    eventsUrl,
    assigneesUrl,
    branchesUrl,
    tagsUrl,
    blobsUrl,
    gitTagsUrl,
    gitRefsUrl,
    treesUrl,
    statusesUrl,
    languagesUrl,
    stargazersUrl,
    contributorsUrl,
    subscribersUrl,
    subscriptionUrl,
    commitsUrl,
    gitCommitsUrl,
    commentsUrl,
    issueCommentUrl,
    contentsUrl,
    compareUrl,
    mergesUrl,
    archiveUrl,
    downloadsUrl,
    issuesUrl,
    pullsUrl,
    milestonesUrl,
    notificationsUrl,
    labelsUrl,
    releasesUrl,
    deploymentsUrl,
    createdAt,
    updatedAt,
    pushedAt,
    gitUrl,
    sshUrl,
    cloneUrl,
    svnUrl,
    homepage,
    size,
    stargazersCount,
    watchersCount,
    language,
    hasIssues,
    hasProjects,
    hasDownloads,
    hasWiki,
    hasPages,
    hasDiscussions,
    forksCount,
    mirrorUrl,
    archived,
    disabled,
    openIssuesCount,
    license,
    allowForking,
    isTemplate,
    webCommitSignoffRequired,
    topics,
    visibility,
    forks,
    openIssues,
    watchers,
    defaultBranch,
    score,
  ];
}

class LicenseEntity extends Equatable {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  const LicenseEntity({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });
  LicenseModel toModel() =>
      LicenseModel(
        key: key,
        name: name,
        spdxId: spdxId,
        url: url,
        nodeId: nodeId,
      );
  @override
  List<Object?> get props => [key, name, spdxId, url, nodeId];
}

class OwnerEntity extends Equatable {
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

  const OwnerEntity({
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
  OwnerModel toModel() =>
      OwnerModel(
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
  @override
  List<Object?> get props => [
    login,
    id,
    nodeId,
    avatarUrl,
    gravatarId,
    url,
    htmlUrl,
    followersUrl,
    followingUrl,
    gistsUrl,
    starredUrl,
    subscriptionsUrl,
    organizationsUrl,
    reposUrl,
    eventsUrl,
    receivedEventsUrl,
    type,
    siteAdmin,
  ];
}

