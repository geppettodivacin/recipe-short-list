module Main exposing (..)

import Browser
import Html exposing (Html, a, button, div, h2, img, li, span, text, ul)
import Html.Attributes exposing (class, href, id, src)
import Html.Events exposing (onClick)
import Image
import QRCode


main =
    Browser.sandbox { init = initSections, update = update, view = view }


type Recipe
    = Recipe { title : String, url : String }


type Section
    = Section { title : String, recipes : List Recipe }


initSections =
    [ Section { title = "🥞 Breakfast", recipes = initBreakfasts }
    , Section { title = "🫒 Snacks", recipes = initSnacks }
    , Section { title = "🍝 Dinners", recipes = initDinners }
    , Section { title = "🥗 Sides", recipes = initSnacks }
    , Section { title = "🍰 Desserts", recipes = initDesserts }
    ]


initBreakfasts =
    [ Recipe { title = "Breakfast Risotto", url = "" }
    , Recipe { title = "Gluten Free Breakfast Casserole", url = "https://www.glutenfreepalate.com/gluten-free-breakfast-casserole/" }
    , Recipe { title = "Oatmeal Pancakes", url = "http://milehighmitts.com/oatmeal-pancakes-gluten-free-dairy-free-option/" }
    , Recipe { title = "Peanut Butter Baked Oatmeal", url = "http://milehighmitts.com/peanut-butter-baked-oatmeal-gluten-free-dairy-free-vegan-option/" }
    , Recipe { title = "Peanut Butter Oatmeal Bars", url = "https://reneenicoleskitchen.com/no-bake-peanut-butter-honey-oat-bars/" }
    , Recipe { title = "Peanut Butter Overnight Oats", url = "https://dessertsandsweets.com/peanut-butter-overnight-oats-recipe/" }
    ]


initSnacks =
    [ Recipe { title = "Healthy Chicken Salad", url = "https://www.slenderkitchen.com/recipe/healthy-chicken-salad?utm_medium=social&utm_source=pinterest&utm_campaign=tailwind_tribes&utm_content=tribes&utm_term=682877064_27125012_21217" }
    , Recipe { title = "Keto Cream Cheese Sausage Balls", url = "https://stylishcravings.com/keto-cream-cheese-sausage-balls-recipe/" }
    ]


initDinners =
    [ Recipe { title = "BBQ Pulled Pork", url = "https://butterwithasideofbread.com/slow-cooker-bbq-pulled-pork/" }
    , Recipe { title = "Best Classic Stuffed Peppers", url = "https://kristineskitchenblog.com/stuffed-peppers/" }
    , Recipe { title = "Chicken Fajita Casserole", url = "http://joyfilledeats.com/chicken-fajita-casserole/" }
    , Recipe { title = "Chicken Fajita Soup", url = "https://www.aspicyperspective.com/skinny-chicken-fajita-soup/#recipe" }
    , Recipe { title = "Chicken Souvlaki", url = "https://www.chefdehome.com/recipes/772/chicken-souvlaki" }
    , Recipe { title = "Classic Homemade Chili", url = "https://tastesbetterfromscratch.com/classic-homemade-chili/" }
    , Recipe { title = "Creamy Cajun Chicken and Sausage Pasta", url = "https://whatmollymade.com/one-pot-creamy-cajun-chicken-pasta/" }
    , Recipe { title = "Creamy Mediterranean Chicken Dinner", url = "https://www.kyleecooks.com/creamy-mediterranean-chicken-skillet/" }
    , Recipe { title = "Crock Pot Taco Soup", url = "https://www.beyerbeware.net/crock-pot-low-carb-taco-soup/" }
    , Recipe { title = "Crockpot Potato Soup", url = "https://www.simplejoy.com/crockpot-potato-soup-recipe/" }
    , Recipe { title = "Fried Rice", url = "https://spaceshipsandlaserbeams.com/better-than-take-out-fried-rice/" }
    , Recipe { title = "Garlic Butter Quinoa", url = "https://www.lordbyronskitchen.com/garlic-butter-quinoa/" }
    , Recipe { title = "Ground Beef & Pasta Skillet", url = "https://www.eatingwell.com/recipe/258448/ground-beef-pasta-skillet/?utm_source=pinterest.com&utm_medium=social&utm_campaign=social-share-recipe&utm_content=20210808&utm_term=258448" }
    , Recipe { title = "Ground Beef Stroganoff", url = "https://togetherasfamily.com/easy-ground-beef-stroganoff/" }
    , Recipe { title = "Homemade Classic Chili", url = "" }
    , Recipe { title = "Honey Butter Chicken", url = "https://realhousemoms.com/honey-butter-chicken/" }
    , Recipe { title = "Honey Garlic Glazed Salmon", url = "https://www.thechunkychef.com/honey-garlic-glazed-salmon/" }
    , Recipe { title = "Instant Pot Beef Stew", url = "https://thefoodieandthefix.com/21-day-fix-instant-pot-beef-stew/" }
    , Recipe { title = "Instant Pot Keto Tuscan Soup", url = "https://www.eatwell101.com/instant-pot-keto-tuscan-soup-recipe" }
    , Recipe { title = "Keto Lasagna Soup", url = "https://slimmingviolet.com/keto-crockpot-recipes/" }
    , Recipe { title = "Loaded Chicken and Potatoes Casserole", url = "http://www.stockpilingmoms.com/2013/08/loaded-chicken-and-potatoes-casserole/" }
    , Recipe { title = "Low Carb Cheeseburger Bites", url = "https://masonfit.com/healthy-cheeseburger-bites/" }
    , Recipe { title = "Low Carb Meatloaf", url = "http://the-lowcarb-diet.com/low-carb-meatloaf/#_a5y_p=2774853" }
    , Recipe { title = "Million Dollar Chicken Bake", url = "https://easyfamilyrecipes.com/million-dollar-chicken-bake/" }
    , Recipe { title = "One Pot Creamy Cajun Chicken Pasta [Dairy Free]", url = "https://whatmollymade.com/one-pot-creamy-cajun-chicken-pasta/" }
    , Recipe { title = "Pizza Dough", url = "https://bellyfull.net/quick-and-easy-pizza-dough/" }
    , Recipe { title = "Pollo con Queso", url = "https://farmlifediy.com/pollo-con-queso-low-carb-keto/" }
    , Recipe { title = "Queso Soup", url = "https://farmlifediy.com/queso-soup/" }
    , Recipe { title = "Shakshuka ", url = "https://www.themediterraneandish.com/shakshuka-recipe/" }
    , Recipe { title = "Shrimp & Sausage Skillet", url = "https://www.paleonewbie.com/20-minute-shrimp-sausage-paleo-skillet-meal/" }
    , Recipe { title = "Slow Cooker Chicken Burrito Bowls", url = "https://www.thekitchn.com/recipe-slow-cooker-chicken-burrito-bowls-207333" }
    , Recipe { title = "Slow Cooker Creamy Tomato Basil Tortellini Soup", url = "https://www.cookingclassy.com/slow-cooker-creamy-tomato-basil-tortellini-soup/" }
    , Recipe { title = "Steak Bites with Sweet Potatoes and Peppers", url = "https://oursaltykitchen.com/whole30-steak-bites/#recipe" }
    , Recipe { title = "Stuffed Pepper Soup", url = "https://www.paleorunningmomma.com/stuffed-pepper-soup-instant-pot-whole30/" }
    , Recipe { title = "Tomato Basil Cucumber Salad With Feta Cheese and Brown Rice", url = "https://www.food.com/recipe/tomato-basil-cucumber-salad-with-feta-cheese-and-brown-rice-480977" }
    ]


initSides =
    [ Recipe { title = "Loaded Deviled Eggs", url = "https://dashingdish.com/recipe/instant-pot-deviled-eggs" }
    , Recipe { title = "Naan", url = "https://www.washingtonpost.com/news/voraciously/wp/2020/05/27/warm-soft-homemade-naan-is-the-no-fuss-bread-for-the-no-fuss-baker/" }
    , Recipe { title = "Oven Roasted Parmesan Potatoes", url = "https://thecarefreekitchen.com/parmesan-roasted-red-potatoes/" }
    ]


initDesserts =
    [ Recipe { title = "Bread Pudding", url = "https://tornadoughalli.com/the-best-bread-pudding/" }
    , Recipe { title = "Creamy Peanut Butter Pie", url = "https://www.browneyedbaker.com/wprm_print/47132" }
    , Recipe { title = "Frozen Yogurt Bark", url = "https://iheartvegetables.com/chocolate-peanut-butter-frozen-yogurt-bark/" }
    , Recipe { title = "Greek Yogurt Bark", url = "https://www.wellseasonedstudio.com/greek-yogurt-bark/" }
    , Recipe { title = "Homemade Cinnamon Roll Cake", url = "https://www.thecountrycook.net/cinnamon-roll-cake/" }
    , Recipe { title = "No Bake Cookie", url = "https://www.twopeasandtheirpod.com/no-bake-cookies/" }
    , Recipe { title = "No Bake Reese's Peanut Butter Cup Cheesecake", url = "https://www.thereciperebel.com/no-bake-reeses-peanut-butter-cup-cheesecake-recipe-video/" }
    , Recipe { title = "Peanut Butter Sheet Cake", url = "https://www.sixcleversisters.com/the-perfect-peanut-butter-sheet-cake/" }
    ]


type Msg
    = NoOp


update msg model =
    model


view model =
    List.map toSection model
        |> Html.div []


toSection section =
    case section of
        Section s ->
            Html.section []
                [ h2 [] [ text s.title ]
                , ul [ class "recipe-list" ]
                    (List.map toItem s.recipes)
                ]


toItem : Recipe -> Html msg
toItem recipe =
    case recipe of
        Recipe r ->
            li [ class "recipe-item" ] [ span [ class "recipe-title" ] [ a [ href r.url ] [ text r.title ] ], viewQRCode r.url ]


viewQRCode : String -> Html msg
viewQRCode message =
    QRCode.fromString message
        |> Result.map
            (\qrCode ->
                Html.img
                    [ QRCode.toImage qrCode
                        |> Image.toPngUrl
                        |> src
                    , class "qr-code"
                    ]
                    []
            )
        |> Result.withDefault
            (Html.text "Error while encoding to QRCode.")
