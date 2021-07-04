## Purposes of this App
- Help boys remember their girl's like/dislike about anything (activity, sport, gift)
- Help boys design schedule to satisfy their girl
- The idea does not limit to the one lady you spend life with, here "the girl" means the "important person" you want to have more persistent digital memory about their preferences. At least, I have to addmit that I do not have enough knowledge about my Mom's preferences on many things, no need to mention my old man

<br/>

## Feature required by the purposes
1. The App should know the important person
    1. The App should allow creating important person
        - Name
        - DOB
2. Help boys remember their girl's like/dislike about anything
    1. The App should take inputs of:
        - object name (how to avoid conflict?)
        - type of the object (makeup stuff, flower, shoes, playing soccer, going to library? ...)
        - like or dislike
        - context of the mentioning (Do they really like it or it was just to satisfy the boys)
    2. Given an object name, the App should return:
        - like or dislike
        - a **summarized context** (where the analysis happens)
            - Currently, just give a list of context ordered by timestamp
            - Improve in the future
    3. User should be able to select a type and see the girl's like/dislike objects of the type
3. Help boys design personal schedule to satisfy their girl

<br/>

## Implementation details about the features:
### 2.1 The App should take inputs of object name, type, context for a selected person
    - SQL database create table:
        - Object Table: object_id (unique), name (unique), type
        - Context Table: person_id, object_id, context (small paragraph)
        - Person Table: person_id (unique), name, DOB
    - SQL database insert object:
        - Insert to Object Table
        - Insert to Context Table

<br/>

## Constraints:
- There is no point to store everyone's preference in a central database, except information trading for money, which apprently is not a concern of this project at least for now lol; thus it will be an off-line application
- Currently, the App will not be always alive, but the data have to be consistent during each fresh start; save data to a file
- Currently, the App should be used by a single user
- Currently, the App is not expect to store data of thousands-GB data

<br/>

## Technology selection:
- Python Flask for small amount of traffic and easy implementation
- SQLite for small amount of data, file as a database => data consistency after fresh start
