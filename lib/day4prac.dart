//product list

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

class Student {
  String name;
  int id;

  Student({required this.name, required this.id});
}

class Gear {
  String name;
  double pricePerDay;
  bool isRentedOut;

  Gear({
    required this.name,
    required this.pricePerDay,
    required this.isRentedOut,
  });
}

class Movie {
  String title;
  int availableSeats;
  double ticketPrice;

  Movie({
    required this.title,
    required this.availableSeats,
    required this.ticketPrice,
  });
}

class Post {
  String content;
  int likes;
  int comments;

  Post({required this.content, required this.likes, required this.comments});
}

void main() {
  List<Product> inventory = [
    Product(name: "Rynox jacket", price: 370.5),
    Product(name: "Rynox saddlebags", price: 320.5),
    Product(name: "Rynox tailbags", price: 355.2),
  ];

  //  The Search Function
  void searchProduct(String searchQuery) {
    bool found = false;

    // Write a 'for' loop here that loops through the 'inventory' list.
    // Inside the loop, check IF the current product's name matches the 'searchQuery'.
    // If it matches, print something like "Found [name] for Rs[price]" and set found = true.

    //traditional for loop way
    /*
    for(int i=0;i<inventory.length; i++){
      if(inventory[i].name == searchQuery){
        print('Found ${inventory[i].name} for Rs${inventory[i].price}');
        found = true;
        break;
      }
    }
    */
    //the new for-in way
    for (Product currentItem in inventory) {
      if (currentItem.name == searchQuery) {
        print('found ${currentItem.name} for Rs${currentItem.price}');
        found = true;
        break;
      }
    }

    if (!found) {
      print("Sorry, $searchQuery is not available.");
    }
  }

  // testing
  searchProduct("Rynox jacket");
  searchProduct("Drone");

  //Student list
  List<Student> studentDirectory = [
    Student(name: "Ishita", id: 1163),
    Student(name: "Arnab", id: 1164),
    Student(name: "Sulagna", id: 1165),
  ];

  void searchName(String searchName) {
    bool found = false;
    for (Student currentName in studentDirectory) {
      if (currentName.name == searchName) {
        print('Found ${currentName.name}');
        found = true;
        break;
      }
    }
    if (!found) {
      print("Sorry, $searchName is not available.");
    }
  }

  void searchId(int idQuery) {
    bool found = false;
    for (Student currentId in studentDirectory) {
      if (currentId.id == idQuery) {
        print('Found ${currentId.id} with name ${currentId.name}');
        found = true;
        break;
      }
    }
    if (!found) {
      print('Sorry, $idQuery not present');
    }
  }

  searchName("Ishita");
  searchName("Swarna");
  searchId(1220);
  searchId(1164);

  //gear rental filter
  List<Gear> warehouse = [
    Gear(name: "GoPro Hero 11", pricePerDay: 450, isRentedOut: true),
    Gear(name: "Rynox Riding Jacket", pricePerDay: 350, isRentedOut: false),
    Gear(name: "DSLR Camera", pricePerDay: 800, isRentedOut: false),
    Gear(name: "4-Person Tent", pricePerDay: 500, isRentedOut: true),
  ];
  // Write a function called showAvailableGear()
  // It should loop through the warehouse list.
  // If 'isRentedOut' is false, print: "[name] is available for ₹[pricePerDay] per day."
  void showAvailableGear(String searchQuery) {
    bool found = false;
    for (Gear currentName in warehouse) {
      if (currentName.name == searchQuery) {
        if (currentName.isRentedOut == false) {
          print(
            '${currentName.name} is available for ${currentName.pricePerDay}',
          );
          found = true;
          break;
        }
      }
    }
    if (!found) {
      print('${searchQuery} is not available for rent');
    }
  }

  showAvailableGear("DSLR Camera");
  showAvailableGear("DSLR camera");

  //cinema ticket checker
  List<Movie> nowShowing = [
    Movie(title: "Dune: Part Two", availableSeats: 0, ticketPrice: 250),
    Movie(title: "Oppenheimer", availableSeats: 12, ticketPrice: 300),
    Movie(title: "Spiderman", availableSeats: 45, ticketPrice: 200),
  ];
  //Write a function called checkAvailability(String movieName, int seatsNeeded)
  // 1. Loop through the 'nowShowing' list.
  // 2. Find the movie by its title.
  // 3. If found, check IF availableSeats is >= seatsNeeded.
  // 4. If yes, print: "Booking confirmed! Total cost: ₹[ticketPrice * seatsNeeded]"
  // 5. If no, print: "Sorry, only [availableSeats] seats left."

  void checkAvailability(String movieName, int seatsNeeded) {
    bool found = false;
    for (Movie current in nowShowing) {
      if (current.title == movieName) {
        found = true;
        if (current.availableSeats >= seatsNeeded) {
          print(
            'Booking confirmed! Total cost: Rs${current.ticketPrice * seatsNeeded} for ${current.title}',
          );
          current.availableSeats -= seatsNeeded;
        } else {
          print(
            'Sorry, only ${current.availableSeats} are left for ${current.title}',
          );
        }
        break;
      }
    }
    if (!found) {
      print('Sorry, the name $movieName is wrong');
    }
  }

  checkAvailability("Spiderman", 4);
  checkAvailability("Spiderman", 50);

  //social media analysis engine
  List<Post> campaignPosts = [
    Post(content: "Top 5 Leadership Strategies", likes: 120, comments: 15),
    Post(content: "Why team retention matters", likes: 340, comments: 42),
    Post(content: "Friday Office Vibes!", likes: 89, comments: 5),
  ];

  //Write a function called findMostPopularPost()
  // 1. Create a variable called 'highestLikes' and set it to 0.
  // 2. Create a variable called 'topPostContent' and set it to "".
  // 3. Loop through the list.
  // 4. If the current post's likes are GREATER than 'highestLikes':
  //    - Update 'highestLikes' to the new number.
  //    - Update 'topPostContent' to the current post's content.
  // 5. After the loop finishes, print out the winning post!
  void findMostPopularPost() {
    int highestLikes = 0;
    String topPostContent = "";

    // Loop through the list
    for (Post currentPost in campaignPosts) {
      // If the current post has MORE likes than our current 'highestLikes' record...
      if (currentPost.likes > highestLikes) {
        // ...we update our records with the new champion!
        highestLikes = currentPost.likes;
        topPostContent = currentPost.content;
      }
    }

    // After the loop finishes checking every single post, print the winner
    print('🏆 Most Popular Post: "$topPostContent" with $highestLikes likes!');
  }

  findMostPopularPost();
}
