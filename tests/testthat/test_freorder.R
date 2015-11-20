context("Reorder levels in descending order")

test_that("freorder reorders levels of the first argument according to descending order in the second argument", {
  x <- c('b', 'c', 'd', 'a')
  y <- c(1, 3, 2, 4)
  a <- c('b', 'c', 'd', 'a')
  b <- c('a', 'c', 'd', 'b')
  levels(a) <- c('a', 'c', 'd', 'b')

  #check if freorder is able to reorder as expected
  expect_identical(freorder(x, y), factor(a, levels=levels(a)))
  expect_identical(levels(freorder(x, y)), b)
})

test_that("freorder works when there are duplicate numeric values in the second argument", {
  x <- c('b', 'c', 'd', 'a')
  y <- c(1, 2, 2, 4)
  a <- c('b', 'c', 'd', 'a')
  b <- c('a', 'c', 'd', 'b')
  levels(a) <- c('a', 'c', 'd', 'b')

  #check if freorder is able to reorder as expected when there are duplicate numeric values in the second argument
  expect_identical(freorder(x, y), factor(a, levels=levels(a)))
  expect_identical(levels(freorder(x, y)), b)

  x1 <- c('b', 'c', 'c', 'a')
  y1 <- c(1, 2, 2, 4)
  a1 <- c('b', 'c', 'c', 'a')
  b1 <- c('a', 'c', 'b')
  levels(a1) <- c('a', 'c', 'd', 'b')
  #check if freorder is able to reorder as expected when there are duplicate factors in the first argument
  expect_identical(freorder(x, y), factor(a, levels=levels(a)))
  expect_identical(levels(freorder(x, y)), b)
})

test_that("test for invalid arguments of freorder", {
  #expect for failure when two arguments are not with a same length
  x <- c('b', 'c', 'd', 'a')
  y <- c(1, 3, 2)
  expect_that(freorder(x, y), throws_error())

  #expect for failure when the second argument is not a numeric
  z <- c('b', 'c', 'd', 'a')
  expect_that(freorder(x, z), throws_error())

  t <- c(1, 3, 2, 4)
  #expect for failure when the two arguments are not both vectors
  expect_that(freorder(data.frame(x), data.frame(t)), throws_error())
})
