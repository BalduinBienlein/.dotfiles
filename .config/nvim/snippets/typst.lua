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
        image("figs/%/<>.svg"),
        caption: [
        <>
        ],
    )
    ]], { i(1), i(2) })
    ),

    s({ trig = "fig(%a?)", regTrig = true, desc = "create a figure" }, fmt([[
	#figure(
	  {content}
	  caption: [{caption}],
	) <{label}>
	]], {
		caption = i(2, ""),
		label = i(1, ""),
		content = d(3, function(args, snip)
			if not snip.captures[1] or snip.captures[1] == "" then
				-- regular figure
				return sn(nil,
					fmt([[
					image("{path}.{ext}"),
					]], {
						path = f(function()
							return "fig/" .. vim.fn.expand("%:r") .. "/" .. (args[1][1] or nil)
						end),
						ext = c(1, { t("svg"), t("jpg"), t("png") })
					})
				)
			elseif snip.captures[1] == "t" then
				return sn(nil,
					fmt([[
					table(
					    columns: {cols},
					    table.header{head},
					    {content}
					  ),
					]], {
						head = i(1, "[Header][Header]"),
						content = i(2, "[Content], [Content],"),
						cols = f(function(largs)
							-- the number of columns is the number of left brackets [ in the header
							local _, cnt = string.gsub(largs[1][1], "%[", "")
							-- the error for not converting to string was cryptic
							-- wasted 10 minutes on this :(
							return tostring(cnt)
						end, { 1 })
					})
				)
			end
		end, { 1 }),
	})),

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
    #import "/templates/normal.typ": *

    #show: doc =>> template(
        [<>],
        true,
        doc,
    )
    ]], { i(1) })
    ),

    s({ trig = "mla", snippetType = "autosnippet" },
	fmta([[
    #import "/templates/mla.typ": *

    #show: doc =>> template(
        [<>],
        doc,
    )
	]], { i(1) })
	),

    s({ trig = "pst", snippetType = "autosnippet" },
    fmta([[
    #import "/templates/problems.typ": *

    #show: doc =>> template(
        [<>],
        true,
        [<>],
        [<>],
        doc,
    )

    ]], { i(1), i(2), i(3) })
    ),
}
