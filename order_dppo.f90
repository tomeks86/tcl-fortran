program order
implicit none

integer,parameter :: natmx=10000, frmx=50000
real,parameter :: pi=4.*atan(1.)
real :: c(3), h1(3), h2(3), h3(3), xyz1(3), xyz2(3), xyz3(3)
real :: aa, bb, cc, dd, mn, tmp
!real :: Dsn1(17,2), Dsn2(17,2), Psn1(17,2), Psn2(17,2)
real :: Dsn1(17), Dsn2(17), Psn1(17), Psn2(17)
integer :: nat, narg, i, j, io, fr, lfr1, lfr2, lfr3, lfr4
integer :: nfr, ind, ns, nl, k, l1, l2, l3, l4, ckw
character :: plik*40, line*80, myarg*10, nazat*10
logical :: logik

narg=iargc()
if (narg==4) then
	call getarg(1,plik)
	open(20,file=plik,status='old')
	call getarg(2,plik)
	open(30,file=plik,status='old')
	call getarg(3,plik)
	open(40,file=plik,status='old')
	call getarg(4,plik)
	open(50,file=plik,status='old')
else
	write(*,*) "wrong number of parameters"
	stop
endif

!do i=1,17
!	do j=1,2
!		Dsn1(i,j)=0.
!		Dsn2(i,j)=0.
!		Psn1(i,j)=0.
!		Psn2(i,j)=0.
!	end do
!end do
do i=1,17
	Dsn1(i)=0.
	Dsn2(i)=0.
	Psn1(i)=0.
	Psn2(i)=0.
end do

l1=0
l2=0
l3=0
l4=0

ns=0
nl=0
logik=.true.
lfr1=0
!open(60,file="testord")
do while (logik)
	read(20,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	lfr1=lfr1+1
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
			!Dsn1(j,1)=Dsn1(j,1)+(xyz1(3)**2.+xyz2(3)**2.)/2.
			!Dsn1(j,2)=Dsn1(j,2)+(xyz1(3)**4.+xyz2(3)**4.)/2.
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
		!Dsn1(15,1)=Dsn1(15,1)+(xyz1(3)**2.+xyz2(3)**2.+xyz3(3)**2.)/3.
		!Dsn1(15,2)=Dsn1(15,2)+(xyz1(3)**4.+xyz2(3)**4.+xyz3(3)**4.)/3.
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
	lfr2=lfr2+1
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
logik=.true.
do while (logik)
	read(40,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, aa, bb, cc
	!write(*,*) nfr, a, b, c, nat
	lfr3=lfr3+1
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
	lfr4=lfr4+1
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

open(70,file="DPPO.dat")
!write(70,*) "at no. DPPC sn-1 /std dev/ DPPC sn-2 /std dev/ POPC sn-1 /std dev/ POPC sn-2 /std dev/"
write(70,*) "at no. DPPC sn-1 DPPC sn-2 POPC sn-1 POPC sn-2"
do i=1,17
	!write(*,*) l1
	!Dsn1(i,2)=(1.-3.*sqrt((Dsn1(i,2)-Dsn1(i,1)**2.)/(l1-1.)))
	!Dsn1(i,1)=(1.-3.*Dsn1(i,1)/l1)
	Dsn1(i)=(1.-3.*Dsn1(i)/l1)
	Dsn2(i)=(1.-3.*Dsn2(i)/l2)
	Psn1(i)=(1.-3.*Psn1(i)/l3)
	Psn2(i)=(1.-3.*Psn2(i)/l4)
	!write(70,'(i6, 8f10.4)') i+1, Dsn1(i,1), Dsn1(i,2), Dsn2(i,1), Dsn2(i,2), Psn1(i,1), Psn1(i,2), Psn2(i,1), Psn2(i,2)
	!write(70,'(i6, 4f10.4)') i+1, Dsn1(i,1), Dsn2(i,1), Psn1(i,1), Psn2(i,1)
	write(70,'(i6, 4f10.4)') i+1, Dsn1(i), Dsn2(i), Psn1(i), Psn2(i)
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

