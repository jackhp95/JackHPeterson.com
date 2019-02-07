module Request exposing (decodeBlogPost, decodeContact, decodeProject, everything, query)

import DB.Object as Object
import DB.Object.BlogPost as BlogPost
import DB.Object.Contact as Contact
import DB.Object.Project as Project
import DB.Query as Query
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet exposing (SelectionSet, with)
import Type


everything : Cmd Type.Msg
everything =
    query
        |> Graphql.Http.queryRequest "https://api-euwest.graphcms.com/v1/cjramrrgj09zi01ht13w1xqot/master"
        |> Graphql.Http.send Type.GotEverything


query : SelectionSet Type.Everything RootQuery
query =
    -- Define the top-level query.
    -- This syntax is based on the json decode pipeline pattern.
    Graphql.SelectionSet.succeed Type.Everything
        |> with (Query.blogPosts identity decodeBlogPost)
        |> with (Query.contacts identity decodeContact)
        |> with (Query.projects identity decodeProject)


decodeBlogPost : SelectionSet Type.BlogPost Object.BlogPost
decodeBlogPost =
    Graphql.SelectionSet.succeed Type.BlogPost
        |> with BlogPost.title
        |> with BlogPost.teaser
        |> with BlogPost.body
        -- |> with BlogPost.picture
        |> with BlogPost.views



-- |> with BlogPost.tags


decodeContact : SelectionSet Type.Contact Object.Contact
decodeContact =
    Graphql.SelectionSet.succeed Type.Contact
        |> with Contact.color
        |> with Contact.hue
        |> with Contact.href
        |> with Contact.name
        |> with Contact.action
        |> with Contact.handle


decodeProject : SelectionSet Type.Project Object.Project
decodeProject =
    Graphql.SelectionSet.succeed Type.Project
        |> with Project.name
