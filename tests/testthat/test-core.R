test_that("converts angle bracketed levels to NA", {
  expect_equal(
    drs_as_NA(data.frame(Q0_0 = c("1", "<Missing>", "3"))),
    data.frame(Q0_0 = c("1", NA, "3"))
  )
})
