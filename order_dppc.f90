program order
implicit none

integer,parameter :: natmx=10000, frmx=50000
real,parameter :: pi=4.*atan(1.)
real :: c(3), h1(3), h2(3), h3(3), xyz1(3), xyz2(3), xyz3(3)
real :: aa, bb, cc, dd, mn, tmp
!real :: Dsn1(17,2), Dsn2(17,2), Psn1(17,2), Psn2(17,2)
real :: Dsn1(15), Dsn2(15)
integer :: nat, narg, i, j, io, fr
integer :: nfr, ind, ns, nl, k, l1, l2, ckw
character :: plik*40, line*80, myarg*10, nazat*10
logical :: logik

narg=iargc()
if (narg==2) then
	call getarg(1,plik)
	open(20,file=plik,status='old')
	call getarg(2,plik)
	open(30,file=plik,status='old')
else
	write(*,*) "wrong number of parameters"
	stop
endif

do i=1,15
	Dsn1(i)=0.
	Dsn2(i)=0.
end do

l1=0
l2=0

ns=0
nl=0
logik=.true.
!open(60,file="testord")
do while (logik)
	read(20,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	l1=l1+nat/46
	do i=1,nat/46
		do j=1,14
			read(20,*) c(:)
			read(20,*) h1(:)
			read(20,*) h2(:)
			xyz1=h1-c
			xyz2=h2-c
			call norm(xyz1)
			call norm(xyz2)
			Dsn1(j)=Dsn1(j)+(xyz1(3)**2.+xyz2(3)**2.)/2.
		end do
		read(20,*) c(:)
		read(20,*) h1(:)
		read(20,*) h2(:)
		read(20,*) h3(:)
		xyz1=h1-c
		xyz2=h2-c
		xyz3=h3-c
		call norm(xyz1)
		call norm(xyz2)
		call norm(xyz3)
		Dsn1(15)=Dsn1(15)+(xyz1(3)**2.+xyz2(3)**2.+xyz3(3)**2.)/3.
	end do
end do
logik=.true.
do while (logik)
	read(30,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	l2=l2+nat/46
	do i=1,nat/46
		do j=1,14
			read(30,*) c(:)
			read(30,*) h1(:)
			read(30,*) h2(:)
			xyz1=h1-c
			xyz2=h2-c
			call norm(xyz1)
			call norm(xyz2)
			Dsn2(j)=Dsn2(j)+(xyz1(3)**2.+xyz2(3)**2.)/2.
		end do
		read(30,*) c(:)
		read(30,*) h1(:)
		read(30,*) h2(:)
		read(30,*) h3(:)
		xyz1=h1-c
		xyz2=h2-c
		xyz3=h3-c
		call norm(xyz1)
		call norm(xyz2)
		call norm(xyz3)
		Dsn2(15)=Dsn2(15)+(xyz1(3)**2.+xyz2(3)**2.+xyz3(3)**2.)/3.
	end do
end do

!close(60)

open(70,file="DPPC.dat")
write(70,*) "at no. DPPC sn-1 DPPC sn-2"
do i=1,15
	Dsn1(i)=(1.-3.*Dsn1(i)/l1)
	Dsn2(i)=(1.-3.*Dsn2(i)/l2)
	write(70,'(i6, 2f10.4)') i+1, Dsn1(i), Dsn2(i)
end do
close(40)

end program order

subroutine norm(vec)
	real :: vec(3), dl
	integer :: i
	dl=0.
	do i=1,3
		dl=dl+vec(i)*vec(i)
	end do
	dl=sqrt(dl)
	vec=vec/dl
end subroutine norm 

