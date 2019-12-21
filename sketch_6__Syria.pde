import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
import processing.video.*;

Movie Movie, Movie1;
Capture cam;

Twitter twitter;
String searchString = "syriavote";
List<Status> tweets;
 
PFont font;
PImage img, img1;

int currentTweet;
int yPos= 0 ;
int xPos= 0 ;
void setup()
{
  img = loadImage("2.png");
  img1 = loadImage("tweet.png");
  
  size(displayWidth, displayHeight);

  frameRate = 30;
  //Movie = new Movie(this, "video.mp4");
  //Movie.loop();
  Movie1 = new Movie(this, "video.mp4.mp4");
  Movie1.loop();
  Movie1.volume(0);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("3hu3d7SkGOgnDBzolWnsrBcai");
  cb.setOAuthConsumerSecret("AZtSTdKLdITNErx2GciD2wWFc198OCUAKCdkw0VwSq4h7FV0dA");
  cb.setOAuthAccessToken("2277212354-rQnSTSjDx6HLl3xCacQc9qO2oxdUGrH9ToynkRL");
  cb.setOAuthAccessTokenSecret("euAvJRCz52fuWYG8kNxMnOtLxzJ7qx5vFNR4I4e8p1jiX");
  TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();
  getNewTweets();
  currentTweet = 0;
  thread("refreshTweets");
  
  fill(255);
  //rect(0, 0, width, height);
 
}

void draw()
{

  //DONT TOUCH//
  fill(255);
  rect(0, 0, width, height);
  //EVER


image(Movie1, 1, 1,displayWidth, displayHeight);

  //ANYTHING ELSE BELOW THIS PLEASE
 
  //image(Movie, 1, 1);
  //tint(255,255,255,200);
 
  currentTweet = currentTweet;
 
  if (currentTweet >= tweets.size())
  {
    currentTweet = 0;
  }
 
  Status status = tweets.get(currentTweet);
  
  fill((50),(50), (50), (200));
  font = createFont("font_2.TTF", 250);
  textFont(font);
  text(status.getText()+ status.getCreatedAt(), xPos, yPos, 1000, 1000);
 
    fill(255, 255,255);
  font = createFont("1.otf", 90);
  textFont(font);
  text(status.getText()+ status.getCreatedAt(), 753, 403, 1050, 700);
 
 
  fill(255, 0,0);
  font = createFont("1.otf", 90);
  textFont(font);
  text(status.getText()+ status.getCreatedAt(), 750, 400, 1050, 700);
 
 
 image(img, 1, 1);
 
 image(img1, 1400, 0, 250,200);
 
 
  yPos= yPos + 0 ;
 
  if (yPos >= height) {
    yPos = 0; 
    xPos= xPos + 200 ;
  }
   
  if (xPos >= width) {
    xPos = 0;
  }
 
}
 
void getNewTweets()
{
  try
  {
    Query query = new Query(searchString);
 
    QueryResult result = twitter.search(query);
 
    tweets = result.getTweets();
  }
  catch (TwitterException te)
  {
    System.out.println("Failed to search tweets: " + te.getMessage());
    System.exit(-1);
  }
}
 
void refreshTweets()
{
  while (true)
  {
    getNewTweets();
 
    println("Updated Tweets");
 
    delay(5000);
  }
}
  void movieEvent(Movie m) {
  m.read();
  } 