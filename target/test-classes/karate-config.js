function fn(){

	var config = {
		name : "Ramesh",
		baseURL : 'https://reqres.in'
	};
	
	var env = karate.env
	karate.log('The value of env is : ',env);
	
	
	karate.configure('connectTimeout',5000);
	karate.configure('readTimeout',5000);
	
	return config;
}