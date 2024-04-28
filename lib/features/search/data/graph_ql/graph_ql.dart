const String searchRequest = r"""
query search ($input:SearchInput!,$paginate:PaginatorInput){
  search(input:$input,paginate:$paginate){
    data{
      users{
        pageInfo{
        
          hasNext
        }
        items{
          userName
        }
      }
      reviews{
        items{
          title
        }
      }
    }
    code
    success
    message
  }
}
""";