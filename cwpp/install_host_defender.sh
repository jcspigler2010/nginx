curl -sSL -k --header "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiam9uYXRoYW5AY2xlYXJzaGFyay5jb20iLCJyb2xlIjoiYWRtaW4iLCJncm91cHMiOm51bGwsInJvbGVQZXJtcyI6W1syNTUsMjU1LDI1NSwyNTUsMjU1LDEyNywwXSxbMjU1LDI1NSwyNTUsMjU1LDI1NSwxMjcsMF1dLCJwZXJtaXNzaW9ucyI6W3sicHJvamVjdCI6IkNlbnRyYWwgQ29uc29sZSJ9XSwic2Vzc2lvblRpbWVvdXRTZWMiOjE4MDAsImV4cCI6MTYyOTkxMTAzOSwiaXNzIjoidHdpc3Rsb2NrIn0.aPDCsMQxL6tlhrdEkaKzuZZ2Rs6SHIMlniNOfw_Tf3c" -X POST https://twistlock-console.oceast.cloudmegalodon.us:443/api/v1/scripts/defender.sh  | sudo bash -s -- -c "defenders.oceast.cloudmegalodon.us" -d "none"   --install-host --ws-port 443