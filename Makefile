SIZE=1000
MODE=run
OP=insert
I=1

mongo:
	@mongo < flush.js
	@echo "\n----" LOAD mongo/$(OP)/$(SIZE) [1] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/load-1.txt
	@echo "\n----" RUN mongo/$(OP)/$(SIZE) [1] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/run-1.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/$(OP)/$(SIZE) [2] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/load-2.txt
	@echo "\n----" RUN mongo/$(OP)/$(SIZE) [2] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/run-2.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/$(OP)/$(SIZE) [3] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/load-3.txt
	@echo "\n----" RUN mongo/$(OP)/$(SIZE) [3] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/run-3.txt

mongao:
	@mongo < flush.js
	@echo "\n----" LOAD mongo/insert/50000 [1] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/load-1.txt
	@echo "\n----" RUN mongo/insert/50000 [1] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/run-1.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/insert/50000 [2] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/load-2.txt
	@echo "\n----" RUN mongo/insert/50000 [2] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/run-2.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/insert/50000 [3] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/load-3.txt
	@echo "\n----" RUN mongo/insert/50000 [3] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/insert > ../results/50000/insert/mongo/run-3.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/read/50000 [1] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/load-1.txt
	@echo "\n----" RUN mongo/read/50000 [1] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/run-1.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/read/50000 [2] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/load-2.txt
	@echo "\n----" RUN mongo/read/50000 [2] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/run-2.txt
	@mongo < flush.js
	@echo "\n----" LOAD mongo/read/50000 [3] "----\n"
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/load-3.txt
	@echo "\n----" RUN mongo/read/50000 [3] "----\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/50000/read > ../results/50000/read/mongo/run-3.txt
	@echo "\nACABOOOOOOOOOOU\n"

mongo-all:
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/load-$(I).txt
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/mongo/run-$(I).txt

couch-all:
	./bin/ycsb load couchbase2 -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/couchbase/load-$(I).txt
	./bin/ycsb run couchbase2 -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/couchbase/run-$(I).txt

elastic:
	cd /usr/local/var/lib/elasticsearch/data; rm -rf es.ycsb.cluster; cd ~/personal/pdp/YCSB;
	./bin/ycsb load elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/$(SIZE)/insert > ../results/$(SIZE)/insert/elasticsearch/result-final.txt
	./bin/ycsb run elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/$(SIZE)/read > ../results/$(SIZE)/read/elasticsearch/result-final.txt

redis-all:
	redis-cli flushall
	./bin/ycsb load redis -s -P ../workloads/$(SIZE)/$(OP) -p "redis.host=127.0.0.1" -p "redis.port=6379" > ../results/$(SIZE)/$(OP)/redis/load-$(I).txt
	./bin/ycsb run redis -s -P ../workloads/$(SIZE)/$(OP) -p "redis.host=127.0.0.1" -p "redis.port=6379" > ../results/$(SIZE)/$(OP)/redis/run-$(I).txt

couch-run:
	./bin/ycsb run couchbase2 -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/couchbase/run-$(I).txt

cassandra-all:
	cqlsh -f ../cassandra_reset
	./bin/ycsb run cassandra2-cql -p hosts="127.0.0.1" -s -P ../workloads/$(SIZE)/$(OP) > ../results/$(SIZE)/$(OP)/cassandra/run-1.txt

lasanha:
	@echo "\nELASTIC SEARCH\n\n"
	cd /usr/local/var/lib/elasticsearch/data; rm -rf es.ycsb.cluster; cd ~/personal/pdp/YCSB;
	./bin/ycsb load elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/10000/insert > ../results/10000/insert/elasticsearch/result-final.txt
	./bin/ycsb run elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/10000/read > ../results/10000/read/elasticsearch/result-final.txt
	cd /usr/local/var/lib/elasticsearch/data; rm -rf es.ycsb.cluster; cd ~/personal/pdp/YCSB;
	./bin/ycsb load elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/100000/insert > ../results/100000/insert/elasticsearch/result-final.txt
	./bin/ycsb run elasticsearch -p path.home=/usr/local/var/lib/elasticsearch/ -s -P ../workloads/100000/read > ../results/100000/read/elasticsearch/result-final.txt
	cd ..; git add results; git commit -m "final"; git push;
	@echo "\nAE CARAIO\n\n"

mongo-ten-mi:
	@echo "\nMONGO\n\n"
	@mongo < flush.js
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/10000000/insert > ../results/10000000/insert/mongo/load-1.txt
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/10000000/insert > ../results/10000000/insert/mongo/run-1.txt

ten-million:
	@echo "\nCASSANDRA\n\n"
	cqlsh -f ../cassandra_reset
	./bin/ycsb load cassandra2-cql -p hosts="127.0.0.1" -s -P ../workloads/10000000/insert > ../results/10000000/insert/cassandra/load-1.txt
	./bin/ycsb run cassandra2-cql -p hosts="127.0.0.1" -s -P ../workloads/10000000/insert > ../results/10000000/insert/cassandra/run-1.txt
	@echo "\nMONGO\n\n"
	@mongo < flush.js
	./bin/ycsb load mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/10000000/insert > ../results/10000000/insert/mongo/load-1.txt
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/10000000/insert > ../results/10000000/insert/mongo/run-1.txt
	@echo "\nCOUCH\n\n"
	./bin/ycsb load couchbase2 -s -P ../workloads/10000000/insert > ../results/10000000/insert/couchbase/load-1.txt
	./bin/ycsb run couchbase2 -s -P ../workloads/10000000/insert > ../results/10000000/insert/couchbase/run-1.txt

finalize-and-push:
	@echo "\nCOUCH\n\n"
	./bin/ycsb run couchbase2 -s -P ../workloads/10000000/insert > ../results/10000000/insert/couchbase/run-1.txt
	./bin/ycsb run couchbase2 -s -P ../workloads/10000000/read > ../results/10000000/read/couchbase/run-1.txt
	@echo "\nCASSANDRA\n\n"
	./bin/ycsb run cassandra2-cql -p hosts="127.0.0.1" -s -P ../workloads/10000000/read > ../results/10000000/read/cassandra/run-1.txt
	@echo "\nMONGO\n\n"
	./bin/ycsb run mongodb -p mongodb.url="mongodb://127.0.0.1:27017" -s -P ../workloads/10000000/read > ../results/10000000/read/mongo/run-1.txt
	cd ..; git add workloads; git add results; git commit -m "the final commit"; git push -f;
