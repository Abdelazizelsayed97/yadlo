const String registerRequest = r"""
      mutation Register($input: RegisterInput!) {
    register(input: $input) {
      data {
        id
        displayName
        isRegisteredViaSocial
        token

        verifiedEmail
        unVerifiedEmail
      }
      success
      code
      message
    }
  }
    """;
