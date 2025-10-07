return {
    -- math modes
    s({ trig = "cb", snippetType = "autosnippet" },
        fmta("`<>` ", { i(1) })
    ),

    s({ trig = "mcb", snippetType = "autosnippet" },
        fmta([[
        ```<>
        <>
        ```
        ]], { i(1), i(2) })
    ),

    s({ trig = "mt", snippetType = "autosnippet" },
        fmta("$<>$ ", { i(1) })
    ),

    s({ trig = "mmt", snippetType = "autosnippet" },
    fmta("$ <> $ ", { i(1) })
    ),

    s({ trig = "ils", snippetType = "autosnippet" },
    fmta("#h(1fr)", {})
    ),


    s({ trig = "fg", snippetType = "autosnippet" },
    fmta([[
    #figure(
        image("<>"),
        caption: [
        <>
        ],
    )
    ]], { i(1), i(2) })
    ),

    s({ trig = "cent" },
    fmta("#align(center)[<>]", { i(1) })
    ),

    s({ trig = "mla" },
	fmta([[
    #set page(header: context align(right)[Karuth #counter(page).get().first()])

    Tobias Karuth

    #datetime.today().display("[day] [month repr:long] [year]")

    <>

    <>
	]], { i(1), i(2) })
	),

    s({ trig = "head" },
    fmta([[
    #set page(
        header: context {
            if counter(page).get().first() == 1 [
                Tobias Karuth
                #h(1fr)
                <>
                #h(1fr)
                #datetime.today().display("[day] [month repr:long] [year]")
                ]
            else [
                Tobias Karuth
                #h(1fr)
                #datetime.today().display("[day] [month repr:long] [year]")
                ]
            },
        footer: context [
            #align(right)[#counter(page).get().first() of
            #counter(page).final().at(0)]
        ]
    )
    <>
    ]], { i(1), i(2) })
    ),
}
