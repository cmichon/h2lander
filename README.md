# h2lander
In the end, there can be only one H2 release

This small project started when H2 users (myself included) felt that with the latest 3 releases of H2 (1.4.197 to 1.4.199), things were getting slower.

I built a test case based on the following elements:
- Taxonomy database as a use case db, purpose is to find taxonomy for each individual from a given csv population
- 200 virtual user concurrency, each user completing 1000 CTE queries
- CTE was chosen because of its slow nature and recursivity
- connection and measurements are done through web protocol on a database you need to initialize before load tests
- embedded database without the MV_STORE format, pagestore only

As a form of conclusion:
- H2 1.2/1.3 until 1.4.196 have very similar performances
- H2 1.4.197 has a huge performance drop vs H2 1.4.196
- H2 1.4.198 and 1.4.199 have partially recovered, but their performance is still bad compared to H2 1.4.196

