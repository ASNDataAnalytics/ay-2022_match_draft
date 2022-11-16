highchart() |>
  hc_title(
    text = title,
    style = list(fontSize = "15px")
  ) |> 
  hc_chart(
    type = type,
    polar = is_polar,
    inverted = invt
  ) |> 
  hc_xAxis(
    categories = df$name
  ) |> 
  hc_yAxis(
    visible = yvisible
  ) |> 
  hc_tooltip(
    outside = TRUE
  ) |> 
  hc_add_series(
    df,
    name = "Fruit Consumption",
    showInLegend = FALSE
  )


highchart() |> 
  hc_chart(
    type = "steamgraph"
  )



hchart(
  df_long |> 
    filter(
      Variable %in% c(
        "US MD Matched", "DO Matched", "US-IMG Matched", "IMG Matched", 
        "Canadian Matched", "Fifth Pathway Matched Matched"
      )
    ),
  "streamgraph", 
  hcaes(
    x = Year, 
    y = Value, 
    group = Variable
  )
) |>
  hc_tooltip(
    sort = TRUE, 
    table = TRUE 
    ) |> 
  hc_yAxis(
    # options = list(visible = "FALSE")
    visible = FALSE
  ) |> 
  hc_title(
    text = "ASN Nephrology Fellow Survey 2014–2022"
  ) |>
  hc_tooltip(
    sort = TRUE, 
    table = TRUE, 
    valueSuffix = list("%")
  ) 


test_hc <- 
  highchart() |> 
  hc_add_series(
    data = df_long |> 
      filter(
        Variable %in% c(
          "US MD Matched", "DO Matched", "US-IMG Matched", "IMG Matched", 
          "Canadian Matched", "Fifth Pathway Matched Matched"
        )
      ),
    type = "streamgraph",
    hcaes(
      x = Year, 
      y = Value, 
      group = Variable
    )
  ) |> 
  hc_tooltip(
    sort = TRUE, 
    table = TRUE 
  ) |> 
  hc_yAxis(
    visible = FALSE
  )


asn_hc_theme <- hc_theme_merge(
  hc_theme_smpl(),
  hc_theme(
    colors  = c("#00468b","#319b42", "#ff8200", "#0077C8", "#FFB500")
  )
)

test_hc |>
  hc_add_theme(asn_hc_theme)








df_long |> 
  filter(
    Variable %in% c(
      "US MD Matched", "DO Matched", "US-IMG Matched", "IMG Matched", 
      "Canadian Matched", "Fifth Pathway Matched Matched"
      )
    )


## Testing a Change Table  -----


test_df <- 
  df |> 
  select(1, 15, 16)

test_df |> 
  rowwise() |> 
  mutate( 
    pct_diff = (AY_2023 - AY_2022) / AY_2022
  )
    