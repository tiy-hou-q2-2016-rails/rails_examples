
tom = Actor.create! name: "Tom Cruise", photo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Tom_Cruise_avp_2014_4.jpg/330px-Tom_Cruise_avp_2014_4.jpg"
thandie = Actor.create! name:  "Thandie Newton", photo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Thandie_Newton_2%2C_2010.jpg/330px-Thandie_Newton_2%2C_2010.jpg"

mi2 = Movie.create! title: "Mission Impossible 2", year: 1999
topgun = Movie.create! title: "Top Gun", year: 1985

MovieActor.create! movie_id: mi2.id, actor_id: tom.id
MovieActor.create! movie_id: mi2.id, actor_id: thandie.id
MovieActor.create! movie_id: topgun.id, actor_id: tom.id
