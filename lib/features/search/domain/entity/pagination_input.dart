class SearchResultEntity {
  final List<String>? usersResults;

  final List<Reviews>? reviewResults;

  SearchResultEntity({this.usersResults, this.reviewResults});
}

class Reviews {
  final List<ReviewsItem> reviewItems;
  final PageInfo? pageInfo;

  Reviews(this.reviewItems, this.pageInfo);
}

class ReviewsItem {
  final String title;

  ReviewsItem(this.title);
}

class PageInfo {
  final int page;
  final bool hasNext;

  PageInfo(this.page, this.hasNext);
}
class UsersResults{
  final Users users;

  UsersResults(this.users);
}
class Users{

}