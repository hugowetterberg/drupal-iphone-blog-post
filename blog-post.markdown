iPhone development & Drupal
=======================================

This is a guide to integrating a iPhone application with Drupal using the services module with the REST server and OAuth authentication. First off we have some prerequisites (except those required by Drupal):

* A Mac, yep, this is about _iPhone_ development, no cruddy windows machines here. Feel free to do the drupal bit on any \*nix system though.
  * http://store.apple.com
* The iPhone SDK
  * http://developer.apple.com/iphone/
* Git
  * http://git-scm.com/
  * If you don't have it, install using port, fink, tarball or whatever takes your fancy

You can get by without git, just download the zip- or tar-balls off github and place them in the same places as the clones or submodules.

Getting the basics up and running
---------------------------------------

You don't have to use Good Old Drupal. It's basically just the official Drupal release with some added modules and themes in sites/all. But it's what we use at the office, and because of git it makes upgrading all our sites a breeze.

    $ mkdir drupal_iphone
    $ cd drupal_iphone
    $ git clone git://github.com/hugowetterberg/goodold_drupal.git public_html

Pre-Drupal install stuff that you all should be familiar with:

    $ mkdir logs
    $ cd public_html/sites/default
    $ cp default.settings.php settings.php
    $ mkdir themes modules files
    $ chmod a+w settings.php files

The reason that I create a logs directory is that my vhost setup always looks like this:

    <VirtualHost *:80>
        DocumentRoot "/Users/hugowett/Projects/drupal_iphone/public_html"
        ServerName drupaliphone.local
        ErrorLog "../logs"
        <Directory "./">
          AllowOverride All
          Order allow,deny
          Allow from all
        </Directory>
    </VirtualHost>

...and Apache becomes cranky if it's log directory doesn't exist. Needless to say, you need to set up the site so that Apache knows about it (add vhost, restart et cetera) and add a hosts entry to get your dev-domain working locally. I use Hoster (http://www.redwinder.com/macapp/hoster/) to manage my hosts file, but manual editing of the /etc/hosts file works just as well.

Install Drupal as usual and remove write permissions from settings.php.

    $ chmod a-w settings.php

Installing modules
---------------------------------------

There are some basic modules that we should enable to get a web-service that our iPhone app can talk to. First return to public_html, then add the following modules:

    // Services (with the REST-patch applied)
    $ git submodule add git://github.com/hugowetterberg/services.git sites/default/modules/services
    // The rest server
    $ git submodule add git://github.com/hugowetterberg/rest_server.git sites/default/modules/rest_server
    // OAuth
    $ git submodule add git://github.com/hugowetterberg/oauth_common.git sites/default/modules/oauth_common  
    $ git submodule add git://github.com/hugowetterberg/services_oauth.git sites/default/modules/services_oauth
    $ git submodule add git://github.com/hugowetterberg/inputstream.git sites/default/modules/inputstream
    // Utility modules
    $ git submodule add git://github.com/hugowetterberg/query_builder.git sites/default/modules/query_builder
    $ git submodule add git://github.com/hugowetterberg/services_oop.git sites/default/modules/services_oop

Go to admin/build/modules and enable the "OAuth Authentication", "Node Resource", "Query Builder" and "REST Server" modules, this will cause all the required modules to be installed.

Configuration
---------------------------------------

Go to admin/settings/oauth/authorizations and delete all the default authorization levels EXCEPT the "read" authorization, we don't need very fine-grained authorization levels for this test.

Go to admin/build/services/settings and set "OAuth authentication" as the authorization module. Then click the "Authentication" tab and set #retrieve and #index to require "Read access", the others should require "Full access".

If you want to try the REST server out a bit in your browser you could set "Required authentication" to "None" for #retrieve and #index. That will disable all of services access checking (Drupal's permission system will still be in effect though). Then create two or more story nodes with random content and check out out the following urls:

* Fetching a resource
  * services/rest/node/1.yaml
  * services/rest/node/2.yaml
* Using the index
  * services/rest/node.yaml
  * services/rest/node.yaml?sort\_field=created&sort\_order=ASC
  * services/rest/node.yaml?nid=1
  * services/rest/node.yaml?created=1251269200:
  * services/rest/node.yaml?created=1251269100:1251269200
  * services/rest/node.yaml?fields=nid,title,teaser
  * services/rest/node.yaml?fields=nid,title,created,comment_count
* Getting some documentation of the available index operations
  * services/rest/node.yaml?__describe

The syntax for a range criteria is "FROM:TO" and ranges can be left open as either "FROM:" or ":TO". 

Remember to restore the "Required authentication" to "Consumer key and access token" if you want to restrict access to the read operations.

### Create a application entry for the App

Go to user/1/applications/add and give the app a name that suits your iPhone application, maybe "iPhone client". Skip the callback and application type stuff.

The iPhone application
---------------------------------------

Create a iPhone project in Xcode, use the "Window-based application" template. Place it wherever you want, I'll place mine in the folder `~/Documents/CocoaDev` and call it "DrupalApp". 

> If you're feeling very insecure about objective-c (maybe never coded c?), the iPhone and/or Xcode I suggest that you brew a pot of tea, make yourself confortable in a sofa, put the MacBook thingy in your knee and start watching the excellent [Stanford lectures on iPhone Development](http://www.stanford.edu/class/cs193p/cgi-bin/index.php).

Then you need to read [this article](http://www.clintharris.net/2009/iphone-app-shared-libraries/). It details how to set up a project, and Xcode, to link statically to another project. But in this case we're not going to link to cocos2D, but to a library that I developed for use with my application: [HBaseLibrary](http://github.com/hugowetterberg/HBaseLibrary).

Clone the library to whatever location you choose to place it (Choose? What? Why? Read the article!). I place my shared libraries in `~/Documents/CocoaDev/Libraries`, so that's what I'll use in my example here:

    $ git clone git://github.com/hugowetterberg/HBaseLibrary.git ~/Documents/CocoaDev/Libraries/HBaseLibrary

Now use your newfound skills (What? Found? Where? Read the article!) to set up "DrupalApp" so that it links to the "HBaseLibrary". Once you've done that, run "DrupalApp" in the simulator to make sure that all the basic stuff is working before we actually start coding.

Creating the interface
---------------------------------------

The first thing we want our app to do is to get authorized by the user. So lets create a view for that. Right-click on Resources and add a new file. 

![Add file](add-file.png)

Choose the View XIB template and call your XIB "AuthorizationView.xib". Then double click on it to open it up in Interface Builder. Drag two buttons and a label to the view and play around with the styling, positioning et cetera.

This is what we want to attain:

![Authorize me!](authorization-view.png)

One button for requesting authorization and one for resetting the authorization. And a label with a cheerful message that we can display when the process is finished. The only slightly tricky thing here is how to get the pin-striped background. Select the view and choose the "groupTableViewBackgroundColor" from the iPhone SDK palette.

![Pin-stripes](pin-stripes.png)

Starting the coding
---------------------------------------

All done? Great, that's the V in MVC, now let's move on to the C. Save and go back to Xcode. Right-click on Classes in the "Groups & Files" pane and add a UIViewController subclass called "AuthorizationViewController", if Xcode gives you the option to create a xib at the same time you should just uncheck that, as we have one already. Now you have a .h and a .m file for your controller. The .h (header) file contains the @interface definition for your class, which is the specification for what you'll implement in the .m-file.

Now we should add _IBOutlets_ for the objects in the view that the controller needs to know about, and _IBActions_ for the events that we want to receive notifications of. I have made comments in the code describing the different parts that I'm adding to the header file, that's easier than trying to refer to stuff before we have a common vocabulary.

    @interface AuthorizationViewController : UIViewController {
        // These are instance variables that will hold pointers
        // to interface elements.
        UIButton *authorizeButton;
        UIButton *resetButton;
        UILabel *doinGreatLabel;
    }

    // Declaration of properties, this is the same as declaring
    // - (UIButton)authorizeButton;
    // - (void)setAuthorizeButton:(UIButton *);
    // ...but a more semantically cohesive declaration. There are
    // other benefits, like the ability to @synthesize properties,
    // and some memory-management assistance.
    // see http://www.google.com/search?q=objective+c+properties
    // for more details. IBOutlet is a keyword 
    // that's removed by the preprocessor (never compiled)
    // and is used to tell Interface Builder that it can
    // assign objects to them.
    @property (retain) IBOutlet UIButton *authorizeButton;
    @property (retain) IBOutlet UIButton *resetButton;
    @property (retain) IBOutlet UILabel *doinGreatLabel;

    // Class methods, the "-"-sign denotes a instance method
    // the "+"-sign would be used for class methods. IBAction
    // is just a alias for void, but it works just like IBOutlet
    // and lets Interface Builder know that it can set the method
    // as a target for actions.
    - (IBAction)requestAuthorization;
    - (IBAction)resetAuthorization;

    @end

Then switch to the .m-file, use the cmd-opt-up shortcut (![Cmd-Opt-UpArrow](shortcut-for-dummies.png)), or all the manual switching will drive you insane.

The .m file contains a lot of placeholder stuff that's either empty or completely commented out. The __-init(WithNibName)__ method is the equivalent of a constructor in objective-c. Although you shouldn't do too much there in controller classes, as the view isn't ready on init. Another reason is that your view object might be released if the iPhone is short on memory and if your view isn't currently displayed. So all setup relating to the view (or any of the _IBOutlet_ variables) should be done in __-viewDidLoad__.

Add `#import "AuthorizationManager.h"` under the other import, so that we can get to the shared authorization manager. Then add a private @interface so that we can declare some internal methods. It's not necessary to do this, but you'll get warnings like this: `'AuthorizationViewController' may not respond to '-updateInterface'`, when compiling if you don't.

    #import "AuthorizationViewController.h"
    #import "AuthorizationManager.h"

    @interface AuthorizationViewController (Private)

    - (void)updateInterfaceAnimated:(BOOL)animated;

    @end

Uncomment the -viewDidLoad method and add the following:

    - (void)viewDidLoad {
        [super viewDidLoad];
        [self updateInterfaceAnimated:FALSE];
    }

    - (void)updateInterfaceAnimated:(BOOL)animated {
        AuthorizationManager *manager = [AuthorizationManager sharedManager];
        // Disable the authorize button if we already have access
        authorizeButton.enabled = ![manager hasAccess];
        // Change the title of the authorize button if
        // we have a request token.
        if ([manager requestToken]) {
            [authorizeButton setTitle:@"Verify authorization" forState:UIControlStateNormal];
        }

        // Adding some animation code here, just to show you
        // how easy it is to get good-looking animations
        // on the iPhone.
        if (animated) {
            [UIView beginAnimations:@"showSuccessLabel" context:nil];
            [UIView setAnimationDuration:0.3];
        }

        if ([manager hasAccess]) {
            authorizeButton.alpha = 0.0;
            doinGreatLabel.alpha = 1.0;
        }
        else {
            authorizeButton.alpha = 1.0;
            doinGreatLabel.alpha = 0.0;
        }

        if (animated) {
            [UIView commitAnimations];
        }
    }

What we've done so far is to define what types of interface elements our controller can handle, and what is should do with them. But we still have to hook up the actual elements in our xib to the outlets and actions in the controller. Open up AuthorizationView.xib and select "File's Owner" and, select the (i) section of the inspector, and write the name of the view controller class in the Class field.

![Controller class](controller-class.png)

Then open up the connections section in the inspector and start connecting the outlets to the interface elements. Connect the requestAuthorization resetAuthorization actions to the "Touch up inside" events of the respective buttons. Also make sure that the view outlet is connected to the top level view.

![Connect outlets](connecting-outlets.png)

Now we're going to make our view show up when we start the application. If you run it in the simulator now everything will (hopefully) compile but you'll still only get the blank white screen. To do something about that, add a IBOutlet (instance variable & property) for a UITabBarController in your app delegate header file (DrupalAppAppDelegate.h). Yep, this is a test. Take a look at the AuthorizationViewController to see how it should be done.

Then open up the MainWindow.xib and add a "Tab Bar Controller" as a top level object. Select the "Drupal App App Delegate" and connect it's tabBarController outlet to the "Tab Bar Controller".

Now it's time to hook up our AuthorizationViewController to the Tab Bar Controller. Open up "DrupalAppAppDelegate.m" and add the following:

    #import "DrupalAppAppDelegate.h"
    #import "AuthorizationViewController.h"

    @implementation DrupalAppAppDelegate

    @synthesize window, tabBarController;


    - (void)applicationDidFinishLaunching:(UIApplication *)application {    
        // Create a instance of our controller, specifying the name of our xib
        AuthorizationViewController *auth = [[[AuthorizationViewController alloc] initWithNibName:@"AuthorizationView" bundle:nil] autorelease];

        // Create an array of controllers, just the auth controller for now
        NSArray *controllers = [[[NSArray alloc] initWithObjects:auth, nil] autorelease];

        // Pass the controller array to the tab bar controller
        [tabBarController setViewControllers:controllers];

        // Add the tab bar view to our window
        [window addSubview:tabBarController.view];
        [window makeKeyAndVisible];
    }

If you run the app in the simulator now you should see the authorization view and a empty tab bar. Let's add some stuff in the AuthorizationViewController implementation that tells the tab bar how to show the authorization view. Uncomment the -initWithNibName function

    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
        if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
            self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Authorization" image:[UIImage imageNamed:@"info.png"] tag:0];
        }
        return self;
    }


<div style="float: left; margin-right: 10px; background-color: #000000; padding: 5px">![Info image](info.png)</div> Download this info image and add it to your project (The Resources folder is a good place to put it). Many of the interface element images in the iPhone are, like this image, purely alpha-channel oriented. Adding images to your project will automatically make them available to be referenced in code like this and selected for use in interface builder.

### The authorization process

The first step is to set up the shared authorization manager. Add the following code to the -applicationDidFinishLaunching method in the app delegate. Set it up before you instantiate the AuthorizationViewController. Remember to #import the AuthorizationManager and OAConsumer headers.

    // Create a shared authorization manager
    NSURL *baseUrl = [NSURL URLWithString:@"http://drupaliphone.local"];
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:@"92dyZAANYnepnjG69suXV775rKDgnhzi" secret:@"ffRTh8pP9gfWSFpu3NJt6j5v6j4ENZSf"];
    AuthorizationManager *manager = [[[AuthorizationManager alloc] initWithConsumer:consumer baseUrl:baseUrl] autorelease];
    [AuthorizationManager setSharedManager:[manager autorelease]];

The key and secret that I've used in this sample are the ones that I got when I created the iPhone application in Drupal, they won't work for you. Go to user/1/applications and copy the consumer key and secret into your code.

Now open AuthorizationViewController.m, it's time to implement those action methods that we defined in the header. You might have noticed the warnings when compiling, and the fact that the application crashes when you touch any of the buttons in the authorization view. I can recommend two ways of getting the method stubs: 1. copy them from the header file, 2. Write "-re" and press the shortcut key opt+esc to bring up autocompletion options.

    - (void)requestAuthorization {
        AuthorizationManager *manager = [AuthorizationManager sharedManager];

        // Verify access if we got a access token
        if ([manager requestToken]) {
            [manager getAccessToken];
            [self updateInterfaceAnimated:YES];
        }
        else {
            // Get the request token
            // If all goes well we'll be booted into Safari
            // so we don't have to bother with UI updates
            [manager getRequestToken];
        }

    }

    - (void)resetAuthorization {
        AuthorizationManager *manager = [AuthorizationManager sharedManager];
        [manager resetAuthorization];
        [self updateInterfaceAnimated:YES];
    }

Great! You should now have a fully working OAuth workflow. Try it out by starting up your app in the simulator and pressing "Request authorization". Then log in and approve the authorization request. Start up your app and press the "Verify authorization button". If all went well you should see the "Great! You're authorized text" and the app should persist the authorization  between launches.

### The table view and the REST client

Now we're going to create a NodeListController. Right-click on "Classes" and add a UITableViewController subclass just as you did with the AuthorizationViewController.

![Add a table view controller class](table-view-controller.png)

Open the header file for the NodeListController add a #import for RESTClient. A RESTClient and a NSArray instance variable and a init method that takes a rest client in addition to the standard style argument.

    #import "RESTClient.h"

    @interface NodeListController : UITableViewController {
        RESTClient *client;
        NSArray *nodes;
    }

    - (id)initWithStyle:(UITableViewStyle)style restClient:(RESTClient *)aClient;

    @end

Then switch to the implementation file and uncomment the init function and add a rest client parameter as per the header definition. Assign the client parameter to the instance variable and take care to retain it, otherwise it'll get deallocated by the release pool.

    - (id)initWithStyle:(UITableViewStyle)style restClient:(RESTClient *)aClient {
        if (self = [super initWithStyle:style]) {
            client = [aClient retain];

            // Set some info for the tab bar, we'll use one of the built in items this time
            self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:0];

            // The only parameters we need is some sorting stuff,
            // probably redundant, but it showcases parameter sending
            NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
            [params setObject:@"created" forKey:@"sort_field"];
            [params setObject:@"DESC" forKey:@"sort_order"];

            // Tell the rest client to load the node index
            // We provide two selectors for callbacks, one
            // for success and one for failure
            [client getResourceAsync:[NSURL URLWithString:@"http://drupaliphone.local/services/rest/node.json"] 
                              method:@"GET" 
                          parameters:params 
                              target:self 
                            selector:@selector(restRequest:nodesLoaded:) 
                        failSelector:@selector(restRequest:nodesFailedToLoad:)];
        }
        return self;
    }

Now we'll implement the methods we referenced in the selector.

    - (void)restRequest:(id)request nodesLoaded:(NSArray *)loadedNodes {
        // Store and retain the results
        nodes = [loadedNodes retain];
        // ...and tell the table view to load the new data
        [self.tableView reloadData];
    }

    - (void)restRequest:(id)request nodesFailedToLoad:(NSError *)error {
        // Tell the user about the failure
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed to load nodes" 
                                                        message:[error localizedDescription] 
                                                       delegate:nil cancelButtonTitle:@"Ok" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }

There are some more methods we need to implement. There are already placeholders that you can use as a starting point further down in the code. The first method is used to tell the table view how many rows we have data for. The second is for creating custom table cells for displaying our data.

    // We'll pass the node count if they've been
    // loaded, otherwise we'll return zero.
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        int count = 0;
        if (nodes) {
            count = [nodes count];
        }
        return count;
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *cellIdentifier = @"Node cell";

        // Cells are reused to increase performance
        // when scrolling a table view.
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            // Create a new cell if we didn't get one to reuse
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        }

        // Get the node and set the label text for the cell
        NSDictionary *node = [nodes objectAtIndex:indexPath.row];
        cell.textLabel.text = [node objectForKey:@"title"];

        return cell;
    }

Finally we need to set up the rest client in the application delegate. The REST client is a part of the HBaseLibrary. It uses a delegate to implement it's authentication process, and there's already a delegate implemented to integrate with the AuthorizationManager. Instantiate the RESTClient in -applicationDidFinishLaunching, after the AuthorizationManager has been created. Our old code for the authorization controller instantiation is included, and the controller array initialization has been changed to include the node list controller.

    // Create the REST client
    RESTClient *client = [[[RESTClient alloc] init] autorelease];
    OAuthRESTClientDelegate *oauthDelegate = [[OAuthRESTClientDelegate alloc] initWithAuthorizationManager:manager];
    client.delegate = [oauthDelegate autorelease];

    // Create a instance of our controller, specifying the name of our xib
    AuthorizationViewController *auth = [[[AuthorizationViewController alloc] initWithNibName:@"AuthorizationView" bundle:nil] autorelease];

    // Create a instance of our node list controller
    NodeListController *nodeList = [[[NodeListController alloc] initWithStyle:UITableViewStylePlain restClient:client] autorelease];

    // Create an array of controllers
    NSArray *controllers = [[[NSArray alloc] initWithObjects:nodeList, auth, nil] autorelease];

    // Pass the controller array to the tab bar controller
    [tabBarController setViewControllers:controllers];

    // Select the authorization view if we haven't been authorized
    if (![manager hasAccess]) {
        [tabBarController setSelectedIndex:1];
    }

That's it. It's a simple application, but it integrates properly with Drupal using OAuth and REST, hopefully it'll get you started. There will be a part 2 of this guide, that will add support for write operations (node creation and updating) and maybe some image uploading as well.

The code and database dump
---------------------------------------

There are three repositories that accompanies this blog post:

* The iPhone application
  * http://github.com/hugowetterberg/drupal-iphone-app
* The Drupal site
  * http://github.com/hugowetterberg/drupal-iphone-site
* The blog post and database dump
  * http://github.com/hugowetterberg/drupal-iphone-blog-post

Remember to to run `git submodule update --init` when you check out the drupal repo, many of the used drupal modules are included as submodules.