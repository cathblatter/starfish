test_df <- data.frame(shift_id = c(1,1,2,3,4),
                          shift_xx = c(1,1,2,3,4),
                          size = c(1, 5, 5, 1, 1))

tar_df <- data.frame(shift_id = c(1,1,2),
                         shift_xx = c(1,1,2),
                         size = c(1,5,5))

test_that("shift filtering works as expected", {
  expect_equal(
    test_df |> filter_shifts_where(size >= 5),
    tar_df
    )
})



test_that("shift filtering works as expected with a different variable name", {
  expect_equal(
    test_df |> filter_shifts_where(size >= 5, shift_var = shift_xx),
    tar_df
  )
})
