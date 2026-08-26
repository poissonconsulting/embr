# model pars for smbr2 and cmdstan engine

    Code
      glance
    Output
      # A tibble: 1 x 11
            n     K nchains niters nthin   ess  rhat converged num_divergent
        <int> <int>   <int>  <int> <int> <int> <dbl> <lgl>             <dbl>
      1   300     5       2    250     1     0     0 FALSE                 0
      # i 2 more variables: max_treedepth <int>, ebfmi <dbl>

---

    Code
      coef
    Output
      # A tibble: 5 x 5
        term            estimate lower upper svalue
        <term>             <dbl> <dbl> <dbl>  <dbl>
      1 bHabitatQuality        0     0     0      0
      2 bIntercept             0     0     0      0
      3 bYear                  0     0     0      0
      4 log_sDensity           0     0     0      0
      5 log_sSiteYear          0     0     0      0

---

    Code
      derived
    Output
      # A tibble: 300 x 5
         term         estimate lower upper svalue
         <term>          <dbl> <dbl> <dbl>  <dbl>
       1 eDensity[1]         0     0     0      0
       2 eDensity[2]         0     0     0      0
       3 eDensity[3]         0     0     0      0
       4 eDensity[4]         0     0     0      0
       5 eDensity[5]         0     0     0      0
       6 eDensity[6]         0     0     0      0
       7 eDensity[7]         0     0     0      0
       8 eDensity[8]         0     0     0      0
       9 eDensity[9]         0     0     0      0
      10 eDensity[10]        0     0     0      0
      # i 290 more rows

---

    Code
      tidy
    Output
                   term estimate lower upper esr rhat
      1 bHabitatQuality        0     0     0   0    0
      2      bIntercept        0     0     0   0    0
      3           bYear        0     0     0   0    0
      4    log_sDensity        0     0     0   0    0
      5   log_sSiteYear        0     0     0   0    0

---

    Code
      year
    Output
      # A tibble: 30 x 10
         Site  HabitatQuality  Year Visit  Density YearFactor estimate lower upper
         <fct> <fct>          <dbl> <int>    <dbl> <fct>         <dbl> <dbl> <dbl>
       1 Site1 High           2001      3 1135466. 2001              0     0     0
       2 Site1 High           2001.     3 1135466. 2001              0     0     0
       3 Site1 High           2002.     3 1135466. 2001              0     0     0
       4 Site1 High           2002.     3 1135466. 2001              0     0     0
       5 Site1 High           2002.     3 1135466. 2001              0     0     0
       6 Site1 High           2003.     3 1135466. 2001              0     0     0
       7 Site1 High           2003.     3 1135466. 2001              0     0     0
       8 Site1 High           2003.     3 1135466. 2001              0     0     0
       9 Site1 High           2003.     3 1135466. 2001              0     0     0
      10 Site1 High           2004.     3 1135466. 2001              0     0     0
      # i 20 more rows
      # i 1 more variable: svalue <dbl>

---

    Code
      dd
    Output
      $mcmc
        [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       [38] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       [75] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [112] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [149] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      
      nchains:  2 
      niters:  250 
      
      $data
      # A tibble: 180 x 6
         Site  HabitatQuality  Year Visit  Density YearFactor
         <fct> <fct>          <dbl> <int>    <dbl> <fct>     
       1 Site1 High           2001      3 1135466. 2001      
       2 Site1 High           2001.     3 1135466. 2001      
       3 Site1 High           2002.     3 1135466. 2001      
       4 Site1 High           2002.     3 1135466. 2001      
       5 Site1 High           2002.     3 1135466. 2001      
       6 Site1 High           2003.     3 1135466. 2001      
       7 Site1 High           2003.     3 1135466. 2001      
       8 Site1 High           2003.     3 1135466. 2001      
       9 Site1 High           2003.     3 1135466. 2001      
      10 Site1 High           2004.     3 1135466. 2001      
      # i 170 more rows
      
      attr(,"class")
      [1] "mcmc_data"

---

    Code
      analysis_bare
    Output
      $model
      $code
      data {
        int<lower=0> nObs;
        vector[nObs] Density;
        vector[nObs] Year;
        array[nObs] int<lower=1> Site;
        array[nObs] int<lower=1> YearFactor;
        array[nObs] int<lower=1> HabitatQuality;
        int<lower=1> nSite;
        int<lower=1> nYearFactor;
        int<lower=1> nHabitatQuality;
      }
      
      parameters {
        real bIntercept;
        real bYear;
        vector<lower=0>[nHabitatQuality-1] bHabitatQuality;
        real<lower=0> log_sSiteYear;
        real<lower=0> log_sDensity;
        matrix[nSite, nYearFactor] bSiteYear;
      }
      
      transformed parameters {
          vector[nObs] eDensity;
          vector[nObs] eHabitatQuality;
          for(i in 1:nObs){
              eHabitatQuality[i] = HabitatQuality[i] == 1 ? 0 : bHabitatQuality[HabitatQuality[i]-1];
              eDensity[i] = bIntercept + bYear * Year[i] + eHabitatQuality[i] + bSiteYear[Site[i], YearFactor[i]];
          }
      }
      
      model {
        bIntercept ~ normal(0, 5);
        bYear ~ normal(0, 0.5);
        bHabitatQuality ~ normal(0, 5);
        log_sSiteYear ~ lognormal(0, 5);
        log_sDensity ~ student_t(4.5, 0, 5);
      
        to_vector(bSiteYear) ~ normal(0, exp(log_sSiteYear));
      
        for (i in 1:nObs) {
          Density[i] ~ lognormal(eDensity[i], exp(log_sDensity));
        }
      }
      $fixed
      [1] "^(b|l)"
      
      $derived
      [1] "eDensity"
      
      $select_data
      $select_data$`Year+`
      numeric(0)
      
      $select_data$YearFactor
      factor()
      Levels: 
      
      $select_data$Site
      factor()
      Levels: 
      
      $select_data$Density
      numeric(0)
      
      $select_data$HabitatQuality
      factor()
      Levels: 
      
      
      $center
      character(0)
      
      $scale
      character(0)
      
      $random_effects
      $random_effects$bSiteYear
      [1] "Site"       "YearFactor"
      
      
      $new_expr
      for (i in 1:length(Density)) {
          eHabitatQuality[2] <- bHabitatQuality
          eHabitatQuality[1] <- 0
          fit[i] <- bIntercept + bYear * Year[i] + eHabitatQuality[HabitatQuality[i]] + 
              bSiteYear[Site[i], YearFactor[i]]
          log(prediction[i]) <- fit[i]
          residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      }
      
      $new_expr_vec
      [1] FALSE
      
      $drops
      list()
      
      $nthin
      [1] 1
      
      attr(,"class")
      [1] "cmdstan_model"      "cmdstan_mcmc_model" "smb_model"         
      [4] "mb_model"          
      
      $data
           Site HabitatQuality Year Visit      Density YearFactor
      1   Site1            Low 2001     1 3.719251e+02       2001
      2   Site1            Low 2001     2 3.904872e+02       2001
      3   Site1            Low 2001     3 2.806059e+02       2001
      4   Site1            Low 2001     4 5.659861e+02       2001
      5   Site1            Low 2001     5 1.456889e+02       2001
      6   Site1            Low 2002     1 6.008010e+01       2002
      7   Site1            Low 2002     2 7.280751e+01       2002
      8   Site1            Low 2002     3 4.101001e+02       2002
      9   Site1            Low 2002     4 2.004438e+02       2002
      10  Site1            Low 2002     5 2.482470e+01       2002
      11  Site1            Low 2003     1 2.516425e+04       2003
      12  Site1            Low 2003     2 2.029664e+04       2003
      13  Site1            Low 2003     3 5.404072e+03       2003
      14  Site1            Low 2003     4 2.632859e+03       2003
      15  Site1            Low 2003     5 1.429745e+04       2003
      16  Site1            Low 2004     1 3.527685e+03       2004
      17  Site1            Low 2004     2 1.092922e+04       2004
      18  Site1            Low 2004     3 7.425996e+04       2004
      19  Site1            Low 2004     4 6.524419e+04       2004
      20  Site1            Low 2004     5 3.319505e+04       2004
      21  Site1            Low 2005     1 1.143217e+04       2005
      22  Site1            Low 2005     2 3.517694e+03       2005
      23  Site1            Low 2005     3 1.574951e+04       2005
      24  Site1            Low 2005     4 1.087863e+04       2005
      25  Site1            Low 2005     5 7.250721e+03       2005
      26  Site1            Low 2006     1 1.035864e+06       2006
      27  Site1            Low 2006     2 6.692083e+05       2006
      28  Site1            Low 2006     3 4.275406e+06       2006
      29  Site1            Low 2006     4 2.937824e+06       2006
      30  Site1            Low 2006     5 5.702662e+05       2006
      31  Site1            Low 2007     1 7.474502e+05       2007
      32  Site1            Low 2007     2 2.171539e+04       2007
      33  Site1            Low 2007     3 6.577580e+04       2007
      34  Site1            Low 2007     4 5.703267e+04       2007
      35  Site1            Low 2007     5 1.436062e+04       2007
      36  Site1            Low 2008     1 5.878848e+04       2008
      37  Site1            Low 2008     2 2.724899e+05       2008
      38  Site1            Low 2008     3 5.926280e+03       2008
      39  Site1            Low 2008     4 1.830754e+04       2008
      40  Site1            Low 2008     5 4.363335e+04       2008
      41  Site1            Low 2009     1 1.346198e+08       2009
      42  Site1            Low 2009     2 5.241749e+07       2009
      43  Site1            Low 2009     3 4.120756e+07       2009
      44  Site1            Low 2009     4 4.249044e+07       2009
      45  Site1            Low 2009     5 3.571557e+07       2009
      46  Site1            Low 2010     1 5.274256e+04       2010
      47  Site1            Low 2010     2 8.045437e+04       2010
      48  Site1            Low 2010     3 1.122087e+05       2010
      49  Site1            Low 2010     4 3.543902e+04       2010
      50  Site1            Low 2010     5 2.550470e+05       2010
      51  Site2           High 2001     1 1.075129e-02       2001
      52  Site2           High 2001     2 5.022435e-02       2001
      53  Site2           High 2001     3 4.238899e-02       2001
      54  Site2           High 2001     4 2.638218e-02       2001
      55  Site2           High 2001     5 6.106917e-02       2001
      56  Site2           High 2002     1 1.074264e-01       2002
      57  Site2           High 2002     2 7.846099e-02       2002
      58  Site2           High 2002     3 1.409466e-01       2002
      59  Site2           High 2002     4 2.314006e-01       2002
      60  Site2           High 2002     5 2.193745e-01       2002
      61  Site2           High 2003     1 1.984484e-04       2003
      62  Site2           High 2003     2 9.549400e-05       2003
      63  Site2           High 2003     3 3.678102e-04       2003
      64  Site2           High 2003     4 4.026122e-04       2003
      65  Site2           High 2003     5 2.584361e-05       2003
      66  Site2           High 2004     1 2.220279e-01       2004
      67  Site2           High 2004     2 5.018066e-01       2004
      68  Site2           High 2004     3 7.737982e-01       2004
      69  Site2           High 2004     4 3.773981e+00       2004
      70  Site2           High 2004     5 1.238856e+00       2004
      71  Site2           High 2005     1 5.337905e-01       2005
      72  Site2           High 2005     2 1.663237e+00       2005
      73  Site2           High 2005     3 1.761745e+01       2005
      74  Site2           High 2005     4 2.180495e+00       2005
      75  Site2           High 2005     5 8.000370e+00       2005
      76  Site2           High 2006     1 1.530726e+00       2006
      77  Site2           High 2006     2 3.024327e+00       2006
      78  Site2           High 2006     3 2.715781e+01       2006
      79  Site2           High 2006     4 9.010787e-01       2006
      80  Site2           High 2006     5 3.168227e+00       2006
      81  Site2           High 2007     1 2.894507e+00       2007
      82  Site2           High 2007     2 9.720801e-01       2007
      83  Site2           High 2007     3 1.524644e+01       2007
      84  Site2           High 2007     4 4.839847e+01       2007
      85  Site2           High 2007     5 1.067805e+01       2007
      86  Site2           High 2008     1 6.807253e-01       2008
      87  Site2           High 2008     2 1.194654e-01       2008
      88  Site2           High 2008     3 2.619255e-02       2008
      89  Site2           High 2008     4 8.466712e-02       2008
      90  Site2           High 2008     5 1.646182e+00       2008
      91  Site2           High 2009     1 1.372516e+01       2009
      92  Site2           High 2009     2 2.509149e+02       2009
      93  Site2           High 2009     3 3.569746e+01       2009
      94  Site2           High 2009     4 5.007475e+01       2009
      95  Site2           High 2009     5 1.178916e+01       2009
      96  Site2           High 2010     1 2.096693e+01       2010
      97  Site2           High 2010     2 1.671333e+02       2010
      98  Site2           High 2010     3 6.661942e+01       2010
      99  Site2           High 2010     4 4.381696e+01       2010
      100 Site2           High 2010     5 8.842945e+01       2010
      101 Site3            Low 2001     1 5.577520e+02       2001
      102 Site3            Low 2001     2 5.031416e+02       2001
      103 Site3            Low 2001     3 1.389215e+02       2001
      104 Site3            Low 2001     4 4.206581e+02       2001
      105 Site3            Low 2001     5 1.359881e+02       2001
      106 Site3            Low 2002     1 5.379380e+01       2002
      107 Site3            Low 2002     2 1.497902e+02       2002
      108 Site3            Low 2002     3 7.348243e+01       2002
      109 Site3            Low 2002     4 1.316242e+02       2002
      110 Site3            Low 2002     5 5.813350e+01       2002
      111 Site3            Low 2003     1 6.995093e-01       2003
      112 Site3            Low 2003     2 3.742794e-01       2003
      113 Site3            Low 2003     3 1.061153e+00       2003
      114 Site3            Low 2003     4 1.169738e+00       2003
      115 Site3            Low 2003     5 3.012396e-01       2003
      116 Site3            Low 2004     1 8.694776e+04       2004
      117 Site3            Low 2004     2 4.396970e+04       2004
      118 Site3            Low 2004     3 3.403484e+05       2004
      119 Site3            Low 2004     4 7.444751e+04       2004
      120 Site3            Low 2004     5 1.880219e+04       2004
      121 Site3            Low 2005     1 1.465253e+05       2005
      122 Site3            Low 2005     2 2.773061e+05       2005
      123 Site3            Low 2005     3 1.560262e+04       2005
      124 Site3            Low 2005     4 2.909518e+04       2005
      125 Site3            Low 2005     5 3.421860e+04       2005
      126 Site3            Low 2006     1 1.201479e+04       2006
      127 Site3            Low 2006     2 1.855999e+05       2006
      128 Site3            Low 2006     3 1.507195e+04       2006
      129 Site3            Low 2006     4 9.311754e+04       2006
      130 Site3            Low 2006     5 2.135183e+05       2006
      131 Site3            Low 2007     1 9.602709e+04       2007
      132 Site3            Low 2007     2 1.127125e+05       2007
      133 Site3            Low 2007     3 5.077841e+04       2007
      134 Site3            Low 2007     4 1.825775e+05       2007
      135 Site3            Low 2007     5 3.939663e+05       2007
      136 Site3            Low 2008     1 8.047912e+03       2008
      137 Site3            Low 2008     2 1.699133e+04       2008
      138 Site3            Low 2008     3 4.694824e+03       2008
      139 Site3            Low 2008     4 1.107487e+04       2008
      140 Site3            Low 2008     5 1.212622e+04       2008
      141 Site3            Low 2009     1 4.549025e+03       2009
      142 Site3            Low 2009     2 3.787574e+03       2009
      143 Site3            Low 2009     3 6.630746e+04       2009
      144 Site3            Low 2009     4 6.642354e+03       2009
      145 Site3            Low 2009     5 1.671499e+04       2009
      146 Site3            Low 2010     1 6.273425e+05       2010
      147 Site3            Low 2010     2 7.412778e+05       2010
      148 Site3            Low 2010     3 2.186401e+05       2010
      149 Site3            Low 2010     4 1.060203e+05       2010
      150 Site3            Low 2010     5 1.917813e+05       2010
      151 Site4           High 2001     1 4.276486e-02       2001
      152 Site4           High 2001     2 7.783919e-02       2001
      153 Site4           High 2001     3 1.483144e-01       2001
      154 Site4           High 2001     4 1.970181e-02       2001
      155 Site4           High 2001     5 4.712843e-02       2001
      156 Site4           High 2002     1 7.578516e-04       2002
      157 Site4           High 2002     2 4.386656e-03       2002
      158 Site4           High 2002     3 7.112605e-04       2002
      159 Site4           High 2002     4 5.047305e-04       2002
      160 Site4           High 2002     5 1.572039e-03       2002
      161 Site4           High 2003     1 8.812314e-02       2003
      162 Site4           High 2003     2 2.115862e-01       2003
      163 Site4           High 2003     3 1.240401e-01       2003
      164 Site4           High 2003     4 1.299156e-02       2003
      165 Site4           High 2003     5 9.177620e-02       2003
      166 Site4           High 2004     1 6.214817e-01       2004
      167 Site4           High 2004     2 3.153024e+00       2004
      168 Site4           High 2004     3 2.657016e+00       2004
      169 Site4           High 2004     4 4.287730e+00       2004
      170 Site4           High 2004     5 5.352626e-01       2004
      171 Site4           High 2005     1 4.642811e-02       2005
      172 Site4           High 2005     2 2.563080e-01       2005
      173 Site4           High 2005     3 1.785322e-02       2005
      174 Site4           High 2005     4 1.675476e-01       2005
      175 Site4           High 2005     5 7.706266e-02       2005
      176 Site4           High 2006     1 3.516972e+00       2006
      177 Site4           High 2006     2 2.430011e+00       2006
      178 Site4           High 2006     3 1.655977e+00       2006
      179 Site4           High 2006     4 4.386278e+00       2006
      180 Site4           High 2006     5 1.655813e+00       2006
      181 Site4           High 2007     1 2.441241e+01       2007
      182 Site4           High 2007     2 5.335231e+00       2007
      183 Site4           High 2007     3 3.342636e+01       2007
      184 Site4           High 2007     4 8.725419e+00       2007
      185 Site4           High 2007     5 1.447608e+01       2007
      186 Site4           High 2008     1 6.021101e-01       2008
      187 Site4           High 2008     2 2.389449e+00       2008
      188 Site4           High 2008     3 1.438945e+00       2008
      189 Site4           High 2008     4 3.252259e-01       2008
      190 Site4           High 2008     5 8.564688e-01       2008
      191 Site4           High 2009     1 1.583627e+02       2009
      192 Site4           High 2009     2 2.281175e+02       2009
      193 Site4           High 2009     3 4.396390e+01       2009
      194 Site4           High 2009     4 9.851343e+01       2009
      195 Site4           High 2009     5 6.054761e+02       2009
      196 Site4           High 2010     1 1.490379e+03       2010
      197 Site4           High 2010     2 8.816286e+02       2010
      198 Site4           High 2010     3 4.104472e+02       2010
      199 Site4           High 2010     4 1.899584e+02       2010
      200 Site4           High 2010     5 1.408170e+02       2010
      201 Site5            Low 2001     1 9.466230e+01       2001
      202 Site5            Low 2001     2 1.217817e+02       2001
      203 Site5            Low 2001     3 3.019671e+01       2001
      204 Site5            Low 2001     4 2.227261e+02       2001
      205 Site5            Low 2001     5 2.974284e+02       2001
      206 Site5            Low 2002     1 6.857125e+01       2002
      207 Site5            Low 2002     2 6.724588e+02       2002
      208 Site5            Low 2002     3 6.814159e+01       2002
      209 Site5            Low 2002     4 4.367177e+00       2002
      210 Site5            Low 2002     5 2.652414e+01       2002
      211 Site5            Low 2003     1 1.057873e+03       2003
      212 Site5            Low 2003     2 3.135319e+03       2003
      213 Site5            Low 2003     3 8.392958e+02       2003
      214 Site5            Low 2003     4 1.324481e+03       2003
      215 Site5            Low 2003     5 3.612234e+02       2003
      216 Site5            Low 2004     1 1.599828e+04       2004
      217 Site5            Low 2004     2 2.026188e+03       2004
      218 Site5            Low 2004     3 7.569263e+03       2004
      219 Site5            Low 2004     4 7.867884e+03       2004
      220 Site5            Low 2004     5 1.831196e+03       2004
      221 Site5            Low 2005     1 1.447599e+02       2005
      222 Site5            Low 2005     2 2.610759e+02       2005
      223 Site5            Low 2005     3 3.919394e+01       2005
      224 Site5            Low 2005     4 4.983719e+02       2005
      225 Site5            Low 2005     5 1.036670e+02       2005
      226 Site5            Low 2006     1 3.153481e+01       2006
      227 Site5            Low 2006     2 6.704465e+01       2006
      228 Site5            Low 2006     3 2.371533e+02       2006
      229 Site5            Low 2006     4 2.003014e+02       2006
      230 Site5            Low 2006     5 2.483016e+01       2006
      231 Site5            Low 2007     1 1.820407e+04       2007
      232 Site5            Low 2007     2 1.377576e+05       2007
      233 Site5            Low 2007     3 4.627573e+05       2007
      234 Site5            Low 2007     4 6.443306e+04       2007
      235 Site5            Low 2007     5 5.622566e+04       2007
      236 Site5            Low 2008     1 2.277941e+04       2008
      237 Site5            Low 2008     2 4.766772e+04       2008
      238 Site5            Low 2008     3 4.208990e+03       2008
      239 Site5            Low 2008     4 3.869366e+04       2008
      240 Site5            Low 2008     5 7.592375e+03       2008
      241 Site5            Low 2009     1 2.135291e+06       2009
      242 Site5            Low 2009     2 7.260809e+06       2009
      243 Site5            Low 2009     3 2.214597e+06       2009
      244 Site5            Low 2009     4 2.529848e+06       2009
      245 Site5            Low 2009     5 1.784552e+06       2009
      246 Site5            Low 2010     1 2.520709e+05       2010
      247 Site5            Low 2010     2 2.152124e+05       2010
      248 Site5            Low 2010     3 7.101089e+05       2010
      249 Site5            Low 2010     4 4.323542e+04       2010
      250 Site5            Low 2010     5 3.515736e+04       2010
      251 Site6           High 2001     1 2.202957e-02       2001
      252 Site6           High 2001     2 1.651427e-02       2001
      253 Site6           High 2001     3 6.251957e-02       2001
      254 Site6           High 2001     4 1.531312e-02       2001
      255 Site6           High 2001     5 3.054785e-02       2001
      256 Site6           High 2002     1 9.718537e-01       2002
      257 Site6           High 2002     2 1.128272e-01       2002
      258 Site6           High 2002     3 1.580869e-01       2002
      259 Site6           High 2002     4 2.456234e-01       2002
      260 Site6           High 2002     5 5.944491e-02       2002
      261 Site6           High 2003     1 3.592746e-04       2003
      262 Site6           High 2003     2 5.536472e-04       2003
      263 Site6           High 2003     3 9.647710e-04       2003
      264 Site6           High 2003     4 3.757298e-04       2003
      265 Site6           High 2003     5 3.161478e-03       2003
      266 Site6           High 2004     1 1.802703e-01       2004
      267 Site6           High 2004     2 3.114536e-02       2004
      268 Site6           High 2004     3 5.335701e-01       2004
      269 Site6           High 2004     4 1.642213e-01       2004
      270 Site6           High 2004     5 1.631144e-01       2004
      271 Site6           High 2005     1 1.180917e+01       2005
      272 Site6           High 2005     2 2.136943e+01       2005
      273 Site6           High 2005     3 7.045238e+00       2005
      274 Site6           High 2005     4 1.618278e+01       2005
      275 Site6           High 2005     5 1.021705e+01       2005
      276 Site6           High 2006     1 6.656144e-03       2006
      277 Site6           High 2006     2 2.913606e-02       2006
      278 Site6           High 2006     3 8.155259e-02       2006
      279 Site6           High 2006     4 2.447791e-02       2006
      280 Site6           High 2006     5 2.022111e-01       2006
      281 Site6           High 2007     1 7.368893e-02       2007
      282 Site6           High 2007     2 5.557955e-02       2007
      283 Site6           High 2007     3 1.613235e-02       2007
      284 Site6           High 2007     4 3.607226e-02       2007
      285 Site6           High 2007     5 1.451002e-02       2007
      286 Site6           High 2008     1 5.716424e-01       2008
      287 Site6           High 2008     2 3.171121e+00       2008
      288 Site6           High 2008     3 1.114357e+00       2008
      289 Site6           High 2008     4 3.292645e+00       2008
      290 Site6           High 2008     5 3.644499e+00       2008
      291 Site6           High 2009     1 5.345154e+00       2009
      292 Site6           High 2009     2 1.414494e+01       2009
      293 Site6           High 2009     3 2.835525e+01       2009
      294 Site6           High 2009     4 3.536125e+00       2009
      295 Site6           High 2009     5 2.004813e+01       2009
      296 Site6           High 2010     1 5.931580e+00       2010
      297 Site6           High 2010     2 3.784892e+01       2010
      298 Site6           High 2010     3 1.484458e+01       2010
      299 Site6           High 2010     4 7.589347e+00       2010
      300 Site6           High 2010     5 3.215558e+00       2010
      
      $mcmcr
      named list()
      
      $nthin
      [1] 1
      
      attr(,"class")
      [1] "cmdstan_mcmc_analysis" "cmdstan_analysis"      "mb_analysis"          

