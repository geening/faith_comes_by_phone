# Faith Comes by Phone
####A low-tech call-service to reach some of the poorest and most marginalized people groups with the gospel.  
While missionaries have done an astonishing job translating the Bible, literacy rates remain low in developing reagions of the world (rendering a printed gospel inert).  Morover, these groups are often given Bibles in the nearest 'trade language', instead of the language they speak fluently.  Using audio from [Bible.is](http://www.bible.is/) and the [Digital Bible Platform](http://www.digitalbibleplatform.com/), this service will allow these groups to listen to the Bible in their native language, for as long as they like, for free. The service **does not require a smartphone**, and can be **controlled by SMS messaging**.


### How does it work?
**Phone Numbers:** Churches and missionaries can distribute phone numbers to families without Internet or smartphone access.  Each phone number represents a single country and language.  

**Calling:**
When a user calls or texts the number, the service calls back and plays the audio (incomming calls are free). When a user hangs up, we 'bookmark' their spot for next time (based on their phone number). 

**Texting:**
__When a user texts a verse_ (Example: Romans:8) the service imediatly calls the user and plays that verse.  
_If a user texts a question mark_ the service returns a text based menu of the user's recent play-history.


### How can I help?
Reguardless of your technical expertice, there are lots of opportunities to contribute!  Check the [Help Wanted](https://github.com/cornerstone-sf/faith_comes_by_phone/issues?labels=help+wanted&page=1&state=open) section of this project for more details.

## Development
The project is a [Ruby on Rails](http://rubyonrails.org/) app.  If you are new to Ruby or Rails, learn more at [Code School](https://www.codeschool.com/paths/ruby).  

### Local Development Environment
The application is essentially a 'mashup' of other services.  So while the application is relatively simple, the setup will require creating a few accounts.  

#### Create a Few Accounts
  1) [Create a Twilio account](https://www.twilio.com/try-twilio) and buy a phone number ($1 per month).
  
  2) Use a service like [Forward](https://forwardhq.com/) (30 day trial) to connect your localhost to the outside world.

  3) [Request a Digital Bible Platform account](http://www.digitalbibleplatform.com/signup/).  This may take 24 hours, so use the included key until you recieve your key by email.

#### Configure the Accounts
  4) Configure your local app for you Twilio account by creating ``config/app_config.local.yml`` based on the example.
  ```
  config/app_config.local.yml.example ====> config/app_config.local.yml
  ```
  **[NOTE]** Also add your Digital Bible Platform key when you receive it. 
      
  5) Configure your new Twilio number's Request URL with the domain you chose in Forward HQ. (See screenshot)


#### Start the App
  7) Setup your database with the following command.
  ```
  rake db:setup
  ```  
  **[NOTE]** We are using SQLite locally.  Reset your data by simply deleting ``db/development.sqlite3`` and re-running ``rake db:setup``

  8) Start your server with the following command and visit [localhost:3000](localhost:3000/health).
  ```rails server```
  **[NOTE]** There is no UI so you should just see 'ok'
  
  
  9) Call your Twilio number to test!  You should see activity in you local Rails server/log, and hear the Bible!


