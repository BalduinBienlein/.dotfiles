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

    s({ trig = "counter" },
    fmta([[
    #let words = "<>"

    <>

    #let count = words.matches(regex("[\p{Han}]|\b[[\w--\p{Han}]'’.,\-]+\b")).len()
    Word count #count
    ]], { i(1), i(2) })
    ),

    s({ trig = "cent" },
    fmta("#align(center)[<>]", { i(1) })
    ),

    s({ trig = "lead" },
    fmta("#set par(leading: 1.2em)", {})
    ),

    s({ trig = "line" },
    fmta("#line(length: 50%)", {})
    ),

    s({ trig = "lc", snippetType = "autosnippet" },
    fmta([[
    #import "/templates/lecture.typ": *
    #let title = "<>"
    #let author = "<>"
    #let professor = "<>"
    #let creater = "<>"
    #let time = "<>"
    #let abstract = "<>" 

    #show: note_page.with(title, author, professor, creater, time, abstract)
    ]], { i(1), i(2), i(3), i(4), i(5), i(6)})
    ),

    s({ trig = "tm", snippetType = "autosnippet" },
    fmta([[
    #import "/templates/main.typ": *

    #show: doc =>> template(
        [<>],
        <>,
        doc,
    )
    ]], { i(1), i(2) })
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
