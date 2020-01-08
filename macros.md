## Customer Service Macros

**What are macros?** 

A macro is a pre-written response for customer-facing use, commonly used in help desk software services such as Zendesk or Salesforce. Macros save time, increase productivity, ensure accuracy, and reduce error. 

I create and maintain a repository of over 200 macros for a customer support team. 

### 1. Cloudflare Migration Follow-Up

**Scenario:** Many customers of the platform connect custom domains to their individual sites. In September 2019, our developers migrated all of the domains hosted on our platform over to a service known as Cloudflare. As a result of this migration, the Product team emailed 1,500 users with custom domains on the platform, as there was a small risk that the migration could cause issues for certain domains.

*Initial Email Copy:*

>In an effort to offer optimal speed and security for your school, we'll be migrating Teachable domains (e.g. *yourschool.teachable.com*) to Cloudflare on September 18th. Doing so will allow us to take advantage of the features Cloudflare provides, such as DDOS protection, etc.
>
>We've detected that your custom domain, yourdomain.com, may not be resolving to your Teachable school domain. To avoid any potential outages for your domain, please ensure your custom domain has a CNAME record pointed to your Teachable school's domain in your domain registrar's settings before 9/18.

The email included techincal jargon, as well as concerning language (e.g., "potential outages"). This created confusion and concern for users. As a result, the Customer Care department was quickly inundated with more inbound than the team was prepared to handle. Additionally, custom domain issues are difficult to troubleshoot since the Customer Care team does not have access to users' DNS records.

To support the team through this unexpected inbound, I crafted the following macro that same morning.

*Follow-up Macro:*

>Thanks for reaching out to Teachable! I can understand the importance of ensuring your domain is set up correctly after receiving this email, and I'd be happy to help you with this.
>
>To clarify, this email was sent as a precaution to ensure your domain is set up correctly prior to our Cloudflare migration. This does not necessarily indicate that anything needs to be changed.
>
>That being said, we'd be happy to provide some further guidance so you can review your DNS set up.
>
>First, please check that you are using a **CNAME** record for your domain.
>
>Next, this CNAME record should point your custom domain to your default Teachable subdomain, which is [default Teachable subdomain here]. 
>
>Here is a general example screenshot -- however, please note this might look different on your end, depending on what DNS service you use:
>
>[Screenshot](https://share.getcloudapp.com/kpuyxZ92)
>
>As long as the above is correct on your account, then you should be all set and no changes will need to be made!
>
>If you have further concerns, please feel free to send over a screenshot of your DNS records and we'd be happy to review and look into this further for you.

This macro was quickly utilized by the entire team to respond to customer inquiries. By providing assurance, including more specific instructions, and utilizing an image, we were able to clarify what actions were required by our users. Within 4 hours, ticket numbers decreased from 265 to 7.

### 2. Macro 2

Macro 2 text

[Back to Menu](/index)

