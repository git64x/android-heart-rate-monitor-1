/**
 * (./) udp.pde - how to use UDP library as unicast connection
 * (cc) 2006, Cousot stephane for The Atelier Hypermedia
 * (->) http://hypermedia.loeil.org/processing/
 http://ubaa.net/shared/processing/udp/
 *
 *  Extended by Joey van der Bie to display heart rate value send by Android phone
 *  https://github.com/joeyvanderbie/android-heart-rate-monitor
 */

// import UDP library
import hypermedia.net.*;


UDP udp;  // define the UDP object
int listenport = 6000;// this should be the same as the port in the Android app

int textSize = 180;
/**
 * init
 */
void setup() {
  size(600,600);
  // create a new datagram connection on port 6000
  // and wait for incomming message
  udp = new UDP( this, listenport );
  //udp.log( true ); 		// <-- printout the connection activity
  udp.listen( true );
  
  
  //Draw blank text
  textSize(textSize);
  background(255,0,0);
  fill(255);
  text("--", (width-textSize)/2, (height+textSize)/2);
}

//process events
void draw() {;
}

void displayHeartRate(int heart_rate){
  //display heart rate
  background(255,0,0);
  fill(255);
  text(""+heart_rate, (width-textSize)/2, (height+textSize)/2);
}

/**
 * To perform any action on datagram reception, you need to implement this 
 * handler in your code. This method will be automatically called by the UDP 
 * object each time he receive a nonnull message.
 * By default, this method have just one argument (the received message as 
 * byte[] array), but in addition, two arguments (representing in order the 
 * sender IP address and his port) can be set like below.
 */
// void receive( byte[] data ) {       // <-- default handler
void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  
  
  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length-2);
  String message = new String( data );
  
  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
  
  
  String heartrate[] = split(message, ",");
  displayHeartRate(int(heartrate[0]));
  
}

/** 
 * on key pressed event:
 * send the current key value over the network
 */
void keyPressed() {
    
    String message  = str( key );	// the message to send
    String ip       = "localhost";	// the remote IP address
    int port        = 6100;		// the destination port
    
    // formats the message for Pd
    message = message+";\n";
    // send the message
    udp.send( message, ip, port );  
}





