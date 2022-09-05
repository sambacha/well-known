To associate a website with your app, you need to have the associated domain file on your website and the appropriate entitlement in your app. The apps in the apple-app-site-association file on your website must have a matching Associated Domains Entitlement.


```jsonc
{
  "applinks": {
      "details": [
           {
             "appIDs": [ "ABCDE12345.com.example.app", "ABCDE12345.com.example.app2" ],
             "components": [
               {
                  "#": "no_universal_links",
                  "exclude": true,
                  "comment": "Matches any URL with a fragment that equals no_universal_links and instructs the system not to open it as a universal link."
               },
               {
                  "/": "/buy/*",
                  "comment": "Matches any URL with a path that starts with /buy/."
               },
               {
                  "/": "/help/website/*",
                  "exclude": true,
                  "comment": "Matches any URL with a path that starts with /help/website/ and instructs the system not to open it as a universal link."
               },
               {
                  "/": "/help/*",
                  "?": { "articleNumber": "????" },
                  "comment": "Matches any URL with a path that starts with /help/ and that has a query item with name 'articleNumber' and a value of exactly four characters."
               }
             ]
           }
       ]
   },
   "webcredentials": {
      "apps": [ "ABCDE12345.com.example.app" ]
   },

    "appclips": {
        "apps": ["ABCED12345.com.example.MyApp.Clip"]
    }
}
```


The details dictionary only applies to the applinks service type; other service types don’t use it. The components key is an array of dictionaries that provides pattern matching for components of the URL.

After you construct the association file, place it in your site’s .well-known directory. The file’s URL should match the following format:

```ini
https://<fully qualified domain>/.well-known/apple-app-site-association
```

You must host the file using https:// with a valid certificate and with no redirects.





Add the domains that share credentials with your app. For services other than appclips, you can prefix a domain with *. to match all of its subdomains.

Each domain you specify uses the following format:

<service>:<fully qualified domain>
Starting with macOS 11 and iOS 14, apps no longer send requests for apple-app-site-association files directly to your web server. Instead, they send these requests to an Apple-managed content delivery network (CDN) dedicated to associated domains.

While you’re developing your app, if your web server is unreachable from the public internet, you can use the alternate mode feature to bypass the CDN and connect directly to your private domain.

You enable an alternate mode by adding a query string to your associated domain’s entitlement as follows:

<service>:<fully qualified domain>?mode=<alternate mode>