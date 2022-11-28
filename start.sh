docker build --tag swarch2022ii_1_db .
docker run --name swarch2022ii_1_db -d -p 3000:3306 swarch2022ii_1_db
