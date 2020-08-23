function fn() {    
  var config =

      {
         //Orchestrator API details
          apiBaseURL : 'https://jsonplaceholder.typicode.com',
          apiPathURL : '/posts',
          contenttype: 'application/json',
          invalidapiPathUrl : '/invalidposts'
      }

    return config;
}