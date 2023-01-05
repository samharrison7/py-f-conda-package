subroutine calc_quadratic(a, b, c, x_min, x_max, N, y) bind(c, name='calc_quadratic')
    use iso_c_binding, only: c_double, c_int
    implicit none

    ! Input parameters
    real(c_double), intent(in), value :: a, b, c, x_min, x_max
    ! Number of steps over which to calculate y
    integer(c_int), intent(in), value :: N
    ! Array representing y
    real(c_double), intent(out) :: y(N)
    integer :: i            ! Iterator
    real(c_double) :: x     ! Temporary x for each iteration

    ! Iterate over our x range and calculate y at each step
    do i = 1, N
        x = x_min + (i - 1) * (x_max - x_min) / real(N)
        y(i) = a * x ** 2 + b * x + c
    end do
end subroutine