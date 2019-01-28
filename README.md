## Catapult Harvestmon

Monitor if catapult node is harvesting.
The tool expect and endpoint that returns json in this structure:

```
{"numBlocks":1738760,"numTransactions":142662,"numAccounts":2674}
```

Above json structure is the response of catapult diagnostic endpoint at http://api.beta.catapult.mijin.io:3000/diagnostic/storage. When first initiated, `catapult-harvestmon` will take the json response of given endpoint and persist it in file. It will then run an http endpoint at `localhost:3111`. Any request to `localhost:3111` will trigger `catapult-harvestmon` to check the current height of given catapult endpoint and compare it against previous height. 

Sample output from `catapult-harvestmon`:

```
$ curl localhost:3111
{"ok":true,"msg":"block height incremented from 1744062 to 1744063"}
$ curl localhost:3111
{"ok":false,"msg":"block height did not increment from 1744063. is the node still harvesting?"}
$ # wait 10s
$ curl localhost:3111
{"ok":true,"msg":"block height incremented from 1744063 to 1744064"}
```

#### Usage

Without docker:

- clone the repo
- run this command:

```
./catapult-harvestmon http://api.beta.catapult.mijin.io:3000/diagnostic/storage
```

With docker:

```
docker run -it --rm -p 3111:3111 luxtagofficial/catapult-harvestmon http://api.beta.catapult.mijin.io:3000/diagnostic/storage
```

Once the running, setup an HTTP monitoring tool (ie. uptimemonitor, cabot) to send GET request to `catapult-harvestmon` endpoint and check if its response contains `"ok":true`. If it returns something else, trigger error event.

-- *End of file*