program order
implicit none

integer,parameter :: natmx=10000, frmx=50000
real,parameter :: pi=4.*atan(1.)
real :: c(3), h1(3), h2(3), h3(3), xyz1(3), xyz2(3), xyz3(3)
real :: aa, bb, cc, dd, mn, tmp
!real :: Dsn1(17,2), Dsn2(17,2), Psn1(17,2), Psn2(17,2)
real :: Psn1(17), Psn2(17)
integer :: nat, narg, i, j, io, fr
integer :: nfr, ind, ns, nl, k, l3, l4, ckw
character :: plik*40, line*80, myarg*10, nazat*10
logical :: logik

narg=iargc()
if (narg==2) then
	call getarg(1,plik)
	open(40,file=plik,status='old')
	call getarg(2,plik)
	open(50,file=plik,status='old')
else
	write(*,*) "wrong number of parameters"
	stop
endif

do i=1,17
	Psn1(i)=0.
	Psn2(i)=0.
end do

l3=0
l4=0

ns=0
nl=0

logik=.true.
do while (logik)
	read(40,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	l3=l3+nat/46
	do i=1,nat/46
		do j=1,14
			read(40,*) c(:)
			read(40,*) h1(:)
			read(40,*) h2(:)
			xyz1=h1-c
			xyz2=h2-c
			call norm(xyz1)
			call norm(xyz2)
			Psn1(j)=Psn1(j)+(xyz1(3)**2.+xyz2(3)**2.)/2.
		end do
		read(40,*) c(:)
		read(40,*) h1(:)
		read(40,*) h2(:)
		read(40,*) h3(:)
		xyz1=h1-c
		xyz2=h2-c
		xyz3=h3-c
		call norm(xyz1)
		call norm(xyz2)
		call norm(xyz3)
		Psn1(15)=Psn1(15)+(xyz1(3)**2.+xyz2(3)**2.+xyz3(3)**2.)/3.
	end do
end do
logik=.true.
do while (logik)
	read(50,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	l4=l4+nat/50
	do i=1,nat/50
		do j=1,7
			read(50,*) c(:)
			read(50,*) h1(:)
			read(50,*) h2(:)
			xyz1=h1-c
			xyz2=h2-c
			call norm(xyz1)
			call norm(xyz2)
			Psn2(j)=Psn2(j)+(xyz1(3)**2.+xyz2(3)**2.)/2.
		end do
		do j=8,9
			read(50,*) c(:)
			read(50,*) h1(:)
			xyz1=h1-c
			call norm(xyz1)
			Psn2(j)=Psn2(j)+xyz1(3)**2.
		end do
		do j=10,16
			read(50,*) c(:)
			read(50,*) h1(:)
			read(50,*) h2(:)
			xyz1=h1-c
			xyz2=h2-c
			call norm(xyz1)
			call norm(xyz2)
			Psn2(j)=Psn2(j)+(xyz1(3)**2.+xyz2(3)**2.)/2.
		end do
		read(50,*) c(:)
		read(50,*) h1(:)
		read(50,*) h2(:)
		read(50,*) h3(:)
		xyz1=h1-c
		xyz2=h2-c
		xyz3=h3-c
		call norm(xyz1)
		call norm(xyz2)
		call norm(xyz3)
		Psn2(17)=Psn2(17)+(xyz1(3)**2.+xyz2(3)**2.+xyz3(3)**2.)/3.
	end do
end do


!close(60)

open(70,file="POPC.dat")
write(70,*) "at no. POPC sn-1 POPC sn-2"
do i=1,17
	Psn1(i)=(1.-3.*Psn1(i)/l3)
	Psn2(i)=(1.-3.*Psn2(i)/l4)
	write(70,'(i6, 2f10.4)') i+1, Psn1(i), Psn2(i)
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

