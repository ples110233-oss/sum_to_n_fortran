!=======================================================================
! 程式名稱：sum_to_n
! 功能    ：讀入一個正整數 N，計算 1 + 2 + ... + N 並輸出結果
! 規範    ：Fortran 2008（自由格式，.f90 副檔名）
!=======================================================================
program sum_to_n
    use, intrinsic :: iso_fortran_env, only: int64, error_unit
    implicit none

    integer(int64) :: n          ! 使用者輸入的上限
    integer(int64) :: i          ! 迴圈計數器
    integer(int64) :: total      ! 迴圈累加的總和
    integer(int64) :: formula    ! 用公式 N(N+1)/2 算出的總和（驗算用）
    integer        :: ios        ! 讀取狀態碼（0 表示讀取成功）

    ! ---- 1. 讀取輸入 ----
    write(*, '(a)', advance='no') '請輸入一個正整數 N: '
    read(*, *, iostat=ios) n

    if (ios /= 0) then
        write(error_unit, '(a)') '錯誤：輸入的不是有效的整數。'
        stop 1
    end if

    if (n < 1) then
        write(error_unit, '(a)') '錯誤：N 必須是正整數（N >= 1）。'
        stop 1
    end if

    ! ---- 2. 用迴圈累加 ----
    total = 0_int64
    do i = 1_int64, n
        total = total + i
    end do

    ! ---- 3. 用高斯公式驗算 ----
    formula = n * (n + 1_int64) / 2_int64

    ! ---- 4. 輸出結果 ----
    write(*, '(a, i0, a, i0)') '1 加到 ', n, ' 的總和 = ', total
    write(*, '(a, i0)')        '公式 N(N+1)/2 驗算   = ', formula

end program sum_to_n
