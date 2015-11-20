context("Setting levels to the order as appear in data")

test_that("ffactor reorders levels of the provided argument according to their order of apperance", {
  x <- c('b', 'c', 'd', 'a')
  a <- c('b', 'c', 'd', 'a')
  levels(a) <- a

  #check if ffactor is able to reorder levels as expected
  expect_identical(ffactor(x), factor(a, levels=levels(a)))
  expect_identical(levels(ffactor(x)), x)
})

test_that("test for invalid argument of ffactor", {
  t <- c(1, 3, 2, 4)
  #expect ffactor to accept a vector as argument and return a factor as result
  expect_equal(is.factor(ffactor(x)), is.vector(t))

  #expect for failure when the argument provided is not a vector
  expect_that(ffactor(data.frame(t)), throws_error())
})

test_that("test for corner cases of ffactor", {
  x <- c('b', 'c', 'c', 'a')
  a <- c('b', 'c', 'a')

  #check if ffactor is able to reorder levels as expected when there are duplicates the argument
  expect_identical(ffactor(x), factor(x, levels=a))
  expect_identical(levels(ffactor(x)), a)
})
