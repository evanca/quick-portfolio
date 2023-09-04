# Create a Minimalism GitHub Page for Your Data Science Portfolio in 30 Minutes

[![Portfolio](https://img.shields.io/badge/Portfolio-datatalking.github.io-blue?logo=GitHub)](https://datatalking.github.io/)

When I first started automating excel data analysis with python in 2011, I spent the majority of my time reading 
tutorials and "how-to choose" articles and taking notes to understand or outline accepted "best practice" only to 
find there was no roadmap. Everytime I would ask a software developer or database admin what the best practice was 
there was never one solid answer. When I ended up meeting my first data scientist in 2016 Miles Erickon reply was 
"Well like many things in Data Science... it depends"

What I was able to understand is I needed to know a programming language like python, a version control like github, 
an OS like Linux or MacOS, databases like SQLite or MySQL, flatfiles like CSV or Parquet. The next few years was 
drinking from a firehose of filetypes and formats, a (seemingly) never ending list of Errors and how to document all 
of this which lead to me starting a github page to save my code.

I created my first portfolio in 2015 soon after creating my github page having started [Automate the Boring Stuff]
(https://github.com/datatalking/Automate-The-Boring-Stuff). In the years since then I've changed machines five times 
starting with a 15" IBM Lenovo 720, a 13" MacBookPro, (3)27" iMac and each time the new machine is up and running 
faster due to having a written process to get started.

Whenever I finish a tutorial, update old code, fix a bug, finish a certification, or complete a course for a degree 
I try to update my github and do one or two updates to keep advancing my skillset. Updating and maintaining my 
github portfolio enables me to organize the information in a way that explains the problem it solves or how its 
easier to use.

Having a portfolio to share with clients enables 24/7 access to past projects and demonstrates how easy cloud based 
technology makes working with data much easier and realiable since if my laptop were broken or stolen I have a 
backup. The job 
search is a great opportunity to demonstrate that I've potentially already solved a similar issue in the past and we 
can walk them through the process of thinking about stats, algebra, business and databases that the python code 
references.

I usually have my iPad with 2,000+ research papers or digital books that I can use to guide interviewers through a 
spectrum of code styles, namespaces and architecture choices. If they want to see samples of dashboards 
or visualizations github allows me to share them all in one place. With this 3rd update to my github I'm going to 
create an even more accessible and inclusive portfolio of past work and future projects that are organized around 
subject matter topics that interviewers are most often interested.

This tutorial is an expansion upon what [Chris Khanhtran](https://chriskhanhtran.github.io/), wrote, and I'll be 
adding a darkmode, timeline chart and quick reference searches by topic, category or even down to file names. This 
will be a rough
step-by-step process to help you
learn how to build a simple but powerful GitHub 
page to host your Data 
Science projects. The whole process will take about 30 minutes. Let's get started!

## Step 1: Create a GitHub Account

First, we need to sign up a GitHub account at [https://github.com/](https://github.com/).

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/1.PNG?raw=true"></center>

After signing up, we will log in and move to Step 2.

## Step 2: Create a Repository Named `user-name.github.io`
After all steps in this tutorial are completed, our GitHub page can be accessed at `https://user-name.github.io`. In this step, we will create a repository named `user-name.github.io` where `user-name` is the user name we use to log into GitHub. My user name is `ktran3-simon` so I will create a repository name `ktran3-simon.github.io`.

To create a new repository, we click on the `+` sign at the top right of the screen, next to our profile picture, and select `New repository`.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/2.PNG?raw=true"></center>

We fill the repository name with `user-name.github.io`, select **Public** and then click `Create repository`.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/3.PNG?raw=true"></center>

Next, we will upload the theme to this repository. The theme we will use is the [**Jekyll Minimal theme**](https://github.com/pages-themes/minimal). This GitHub [repository](https://github.com/pages-themes/minimal) has a more concise version of the theme.

<center><img src="https://github.com/ktran3-simon/quick-portfolio/raw/master/images/demo.gif?raw=true"></center>

To download the theme, we go to https://github.com/evanca/quick-portfolio, click `Clone or download` and select `Download ZIP`.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/4.PNG?raw=true"></center>

Now, let's open our newly created repository, which is still empty. We will click `uploading an existing file`. After downloading the theme, we unzip the file and upload these files into our repository. After the uploading is complete, we click `Commit changes`.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/5.PNG?raw=true"></center>

Now, by going to [`user-name.github.io`](https://ktran3-simon.github.io/), we can already see our website! In the next step, we will go through some instructions to customize our portfolio.

**(Optional)** A faster way to complete this step is to simply click the **Fork** button to copy the entire repository to our GitHub account and then change the repository's name to `user-name.github.io`. However I think the above explanation is friendlier for first-time GitHub users.

## Step 3: Customize Our Portfolio

Our GitHub page has a two-column layout. On the left is our profile picture and some description, and on the right is the main page where we present our projects. I really like this design because of its simplicity yet efficiency.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/6.PNG?raw=true"></center>

To customize the sidebar (the left part), we will edit the file `_config.yml` in our repository. We can also add Google Analytics ID to track and analyze traffic to our page.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/7.PNG?raw=true"></center>

To customize the main page (the right part), where we display our projects, we will need to edit `index.md`. This file is written in `Markdown`. If you frequently work with Jupyter Notebook, you must be very familiar with this language. `Markdown` is very easy to use. Here is a helpful [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) that I often refer to.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/8.PNG?raw=true"></center>

#### (Optional) More Customizations

As we customize the sidebar, we will see that we cannot edit the last two lines by editting `_config.yml`:

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/9.PNG?raw=true"></center>

To remove them, we need go to the original repository of the [**Jekyll Minimal theme**](https://github.com/pages-themes/minimal), and copy the content of `default.html` in `_layouts`. Then we create `_layouts/default.html` in our repository by clicking `Creating new file` and typing `_layouts/default.html`, paste the copied content here and commit.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/10.PNG?raw=true"></center>

Now we can remove lines 29-31 in `_layouts/default.html` to remove **View My GitHub Profile**,

```
{% if site.github.is_user_page %}
<p class="view"><a href="{{ site.github.owner_url }}">View My GitHub Profile</a></p>
{% endif %}
```

and line 50 to remove **Hosted on GitHub pages - Theme by orderedlist**.

```
<p><small>Hosted on GitHub Pages &mdash; Theme by <a href="https://github.com/orderedlist">orderedlist</a></small></p>
```

## Step 4: Upload Our Projects

After customizing the design of our GitHub page, we can start adding projects to the page by editing `index.md`. There are several ways to do that, including:
- Link to our GitHub repositories,
- Link to our Jupyter Notebooks,
- Write blog posts in `Markdown`.

My favorite way to add projects is creating a folder in the repository to save the `html` files of Jupyter Notebooks, and add the link `https://user-name.github.io/folder-name/file-name.html` to my main page. Alternatively, we can insert **Google Colab** links so that viewers can run our projects directly. **Google Colab** is basically the same as **Jupyter Notebook** with GPU supported by Google, which helps increase the speed of running our cells, especially in Deep Learning projects. Here is a nice [Google Colab tutorial](https://www.youtube.com/watch?v=KCCzo31Oo8U). If you are an R user, you can use **R markdown** in R Studio to render your projects and export them in the `html` format.

We can also write blog posts in `Markdown` and upload them to our repository. You can always refer to the file `sample_page.md` as an example.

## Tips and Tricks
### Badges with Shields.io
In official repositories on GitHub, we usually see authors use badges to show the status of their project. For example:

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/11.PNG?raw=true"></center>

I really like to use these badges to embed links with call for actions, such as:

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/12.PNG?raw=true"></center>

You can go to https://shields.io/ to create your own badges. Basically, we just need to create links in a specific format and use them as image links.

**Format:**

```
https://img.shields.io/badge/label-message-color?logo=logo_name
```

where:
- `color` could be brightgreen, green, yellowgreen, yellow, orange, red, blue, lightgrey or any HEX, RBG color codes
- `logo`: the list of `logo` of popular brands and their brand color codes can be found at [simple-icons](https://simpleicons.org/)
- Visit [shields.io](https://shields.io/) to learn more

**Examples:**

`https://img.shields.io/badge/Spotify-My_Musics-1ED760?logo=Spotify` will give us: ![](https://img.shields.io/badge/Spotify-My_Musics-1ED760?logo=Spotify)

`https://img.shields.io/badge/PyTorch-Run_in_Colab-EE4C2C?logo=PyTorch` will give us: ![](https://img.shields.io/badge/PyTorch-Run_in_Colab-EE4C2C?logo=PyTorch)

To insert links with badges we created, we only need to type `[![](link-to-our-badge)](link-to-our-project)`.

### More Themes

There are several other themes that we can utilize to be more creative with our portfolio. To use them, we can simply **Fork** the repository to our account and change its name to `user-name.github.io`.

- Cayman: [repo](https://github.com/pages-themes/cayman) - [preview](https://pages-themes.github.io/cayman/)
- Minimal Mistake: [repo](https://github.com/mmistakes/minimal-mistakes) - [preview](https://mmistakes.github.io/minimal-mistakes/collection-archive/). I really like [this portfolio](https://leimao.github.io/) where the author uses this theme.

<center><img src="https://github.com/chriskhanhtran/portfolio-tutorial/blob/master/images/13.PNG?raw=true"></center>
<center> A preview of the Minimal Mistake Theme </center>
    
### Content of Your Portfolio

Last but also the most important thing I want to say in this tutorial, the reason I like a minimalism theme is that it took me minimal time on designing works; thus I can spend more time on the content of my projects. Ultimately, the purpose of building a Data Science portfolio is to present our Data Science project, rather than to show our web-design skills. Below are some articles that I found super helpful when I started building my first portfolio.

- [How to Build a Data Science Portfolio](https://towardsdatascience.com/how-to-build-a-data-science-portfolio-5f566517c79c) in Towards Data Science
- [Data Science Portfolios That Will Get You the Job](https://www.dataquest.io/blog/build-a-data-science-portfolio/) in Dataquest
- [Building a Data Science Portfolio That Stands Out](https://www.springboard.com/blog/data-science-portfolio/) in Springboard Blog
- [5 Data Science Projects That Will Get You Hired in 2018](https://medium.com/@dataoptimal9/5-data-science-projects-that-will-get-you-hired-in-2018-9e51525084e) in Medium

Feel free to visit my portfolio to see how I write my Data Science projects. For example, this is a detailed [notebook](https://chriskhanhtran.github.io/projects/ames-house-price.html) I wrote after completing a Kaggle competition, in which I went through all important steps of a Data Science project, including **Exploratory Data Analysis, Data Cleaning, Feature Engineering, Modeling and Evaluation**. Now I still often revisit this notebook to copy the cross-validation codes to reuse. I found I learn the most by reading notebooks on Kaggle and writing my own projects.

I will likely be making some changes in my portfolio compared to the original version, such as making the sidebar 
narrower and the main page wider. You can **fork** my [repo](https://github.com/datatalking.github.io) and change the 
codes in 
the directory `_sas/Portfolio-datatalking/jekyll-theme-minimal.scss` as you like, including changing width, font 
size or image size. However, be careful when you do so because it might mess your page up. If so, just recover the settings by copying from the theme's original repo.

- change `max-width` in `.wrapper` to change the width of the entire page
- change `max-width` in `section` to change the width of the main page
- change `width` in `header` to change the width of the side bar

<center><img src="https://raw.githubusercontent.com/Portfolio-datatalking/portfolio-tutorial/master/images/portfolio.gif"></center>
<center> My GitHub Page</center>

### Last Words
Having completed your minimalism portfolio, you now can remove or modify these files in your repository:
- **LICENSE**
- **README.md**: you can modify it to the description of your page.
- **sample_page.md**: you can remove or change it to a blog post.
- **pdf/sample_presentation.pdf**

You can also visit the original [tutorial](https://medium.com/@evanca/set-up-your-portfolio-website-in-less-than-10-minutes-with-github-pages-d0efa8ff56fd) with more tips such as:
- How to create thumbnails for your project
- How to create a round profile picture

For me, I use Photoshop and Powerpoint to create pictures used in my GitHub pages.

Thank you so much for staying with me to this point of my first tutorial. Don't hesitate to reach out to me if you've got any questions. Please connect with me on LinkedIn and share with me your Data Science portfolio.
[![](https://img.shields.io/badge/LinkedIn-Connect%20with%20Me-blue?logo=LinkedIn&style=social)](https://www.linkedin.com/in/chriskhanhtran/)
