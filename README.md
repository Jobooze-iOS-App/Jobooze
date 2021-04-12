# Jobooze
Final Project for Codepath iOS course Spring 2021

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Jobooze is an app designed to help users keep track of jobs they are interested in and jobs they've applied to

### App Evaluation
- **Category:** Self-management 
- **Mobile:** App for users to keep track of jobs they applied to 
- **Story:** Allow users to list names of jobs they applied to, including notes, status, date of application submitted, and interview procedures.
- **Market:** Students and anyone looking for jobs and applying to a lot of jobs and doesn't want to lose track of them.
- **Habit:** Users can view and add jobs they applied to, as well as update the jobs in case there is an update in the process
- **Scope:** This app can be further improved by integrating with Linkedin, where if someone applies through Linkedin, it automatically shows up on the app, however we will focus on our required user stories to finish a minimally-viable product first

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login/Logout features
* Create a new note/record of what job the user has applied to with the appropriate tags/status (indicating a job they applied to, will apply to, how important it is to them, etc)
* Delete unwanted notes
* Upload files (like resumes, profile pics, etc)
* Edit/view the listing

**Optional, Nice-to-have Stories**

* Share feature for notes (sharing the positions you've applied to, social-media like feature)
* Could integrate the sharing portion with LinkedIn above, where shared content could be viewed on LinkedIn
* Settings view for like dark mode, font size, etc
* Maybe set an expiration feature, when the note will automatically be deleted

### 2. Screen Archetypes

* Initial View Controller
   * Login feature
   * Signup Feature

* Once user is logged in (dashboard)...
   * Create a new note
   * Edit/view created notes
   * Delete unwanted notes
   * Logout feature

* User Profile View
   * Upload profile pic and resume
   * Update profile info

### 3. Navigation

**Tab Navigation**

* Tab for profile
* Tab for created notes
* Tab for shared notes on other platforms (optional)

**Flow Navigation**

*All screens have access to signing out and tracking a new job/creating a new note*

* Login/Signup Screen
   * Initial view controller
   * Will present subsequent views modally

* Dashboard
   * View Job Notes
   * Edit Job Info

* Profile
   * Chosing a profile pic and resume (file)

* Job Form
   * After adding a new job form, user is returned to the        dashboard

* Edit Job
   * After modifying job information, user is returned to        the dashboard

* View Job Form 
   * Return to the dashboard using the back navigation          button
   * Delete the job posting, which also returns the user to      the dashboard


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

<img src="https://i.imgur.com/A9HJL6j.jpg" width=285 height=550> <img src="https://i.imgur.com/mxtMKjI.jpg" width=285 height=550> 
<img src="https://i.imgur.com/1nk24T3.jpg" width=285 height=550> <img src="https://i.imgur.com/aZRdLnW.jpg" width=285 height=550> 
<img src="https://i.imgur.com/5dxqKqq.jpg" width=285 height=550> <img src="https://i.imgur.com/PI0ppdW.jpg" width=285 height=550> <img src="https://i.imgur.com/iLGyfJA.jpg" width=285 height=550> 
#### Link to Figma Wireframe https://www.figma.com/file/pWJJft77IDMFFPZLyF6tME/Jobooze-iOS?node-id=0%3A1

### [BONUS] Interactive Prototype



## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
