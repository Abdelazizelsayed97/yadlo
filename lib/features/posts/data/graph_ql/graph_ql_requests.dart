const String reviewsQueryRequest = r"""
query reviews($input:PaginatorInput!){
  reviews(paginate:$input){
    code
    success
    message
    data{
      pageInfo{
        page
        limit
        hasNext
        hasBefore
        nextCursor
      }
      items{
        id
name
title
description
type
commentsCount
totalVotes
votesCount
createdAt
updatedAt

        attachments{
          link
        }
user{    
  userName
  id
  
}
   }
  }
 }
}


""";
const String categoriesQueryRequest = r"""
query  categories{
  categories{
    data{
      id
      enName
      subcategories{
        id
        enName
      }
    }
    code
    success
    message
  }
}

""";

const String createReviewRequest = r"""
mutation createReview($input:CreateReviewInput!){
  createReview(input:$input){
    data{
      id
      name
      title
      description
      overallRating
      
      attachments{
        link
        attachmentType
      }
      
    }
    code
    message
    success
  }
}
""";
const String deleteReviewRequest = r"""
mutation deleteReview($reviewId: ID!){
  deleteReview(reviewId:$reviewId){
    code
    message
    success
  }
}
""";
const String userRequest = r"""
query user($userId: String!) {
  user (userId: $userId){
    data{
      id
      userName
      displayName
      verifiedEmail
      gender
      country
      reviewsCount
      followCount{
        followers
        followings
      }
    }
    code
    success
    message
  }
}
""";

const String upLoadRequest = r"""
mutation uploadFile($file: Upload!) {
  uploadFile(file: $file, model:PROFILE_COVER) {
    data
    code
    message
    success
    
  }
}

""";
