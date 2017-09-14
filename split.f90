program split_dppo
implicit none

integer :: i, j, n, k, nat, io, nfr
real :: a, b, c
character :: plik*30, line*80, liczbafr*10, liczbaat*10, fmt*30
logical :: logik

n=iargc()
do i=1,n
	call getarg(i,plik)
	open(30,file=plik)
	open(40,file=trim(plik)//"1")
	open(50,file=trim(plik)//"2")
	logik=.true.
	do while (logik)
		read(30,'(a80)',iostat=io) line
		if (io/=0) then
			logik=.false.
			exit
		endif
		k=index(line,'klatka')
		if (k==1) then
			read(line(11:),*) nfr, nat, a, b, c
		endif
		fmt="(a,i5,i6,3f13.4)"
		!write(liczbafr,"(i10)") nfr
		!write(liczbaat,"(i10)") nat/2
		write(40,fmt) "klatka nr ", nfr, nat/2, a, b, c
		write(50,fmt) "klatka nr ", nfr, nat/2, a, b, c
		do j=1,nat/2
			read(30,'(a80)') line
			write(40,*) line
		end do
		do j=1,nat/2
			read(30,'(a80)') line
			write(50,*) line
		end do
	end do	
	close(30)
	close(40)
	close(50)
end do

end program
