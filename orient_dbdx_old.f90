program orient_dbdx
implicit none

integer,parameter :: natmx=10000, frmx=50000, binmx=90
real,parameter :: pi=4.*atan(1.)
real :: cm1(3), cm2(3), ms1, ms2, xyz(4), sht(0:binmx), lng(0:binmx), a, b, c, vec(3), angle, dd, mn
!real :: 
integer :: nat, narg, i, j, io, fr, lfr1, lfr2, nfr, ind, ns, nl, k
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

do i=0,binmx
	sht(i)=0.0
	lng(i)=0.0
end do

dd=90./binmx
ns=0
nl=0
logik=.true.
lfr1=0
open(50,file="testang2")
do while (logik)
	read(20,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(7:),*) nfr, a, b ,c, nat
	!write(*,*) nfr, a, b, c, nat
	lfr1=lfr1+1
	do i=1,nat/12
		cm1=(/0,0,0/)
		cm2=(/0,0,0/)
		ms1=0
		ms2=0
		do j=1,12
			read(20,*) nazat, xyz(:)
			if ((nazat=="C1").or.(nazat=="C2").or.(nazat=="C3").or.(nazat=="C4").or.(nazat=="C5").or.(nazat=="C14")) then
				cm1=cm1+xyz(1)*xyz(2:)
				ms1=ms1+xyz(1)
			elseif ((nazat=="C7").or.(nazat=="C8").or.(nazat=="C9").or.(nazat=="C10").or.(nazat=="C11").or.(nazat=="C12")) then
				cm2=cm2+xyz(1)*xyz(2:)
				ms2=ms2+xyz(1)
			else
				write(*,*) "atomname not known"
			endif
		end do
		cm1=cm1/ms1
		cm2=cm2/ms2
		vec=cm1-cm2
		call norm(vec)
		mn=1
		if (cm1(3)<0) then
			mn=-1
		endif
		angle=acos(mn*vec(3))*180./pi
		if (angle>90.) then
			angle=angle-90.
		end if
		write(50,'(3f8.3)') vec(:)
		lng(int(angle/dd))=lng(int(angle/dd))+1
		nl=nl+1
	end do
end do
close(50)
logik=.true.
lfr2=0
do while (logik)
	read(30,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(7:),*) nfr, a, b ,c, nat
	!write(*,*) nfr, a, b, c, nat
	lfr2=lfr2+1
	do i=1,nat/2
		cm1(:)=(/0,0,0/)
		cm2(:)=(/0,0,0/)
		ms1=0
		ms2=0
		read(30,*) nazat, ms1, cm1(:)
!		cm1=cm1/ms1
		read(30,*) nazat, ms2, cm2(:)
!		cm2=cm2/ms2
		vec=cm1-cm2
		call norm(vec)
		mn=1
		if (cm1(3)<0) then
			mn=-1
		endif
		angle=acos(mn*vec(3))*180./pi
		if (angle>90.) then
			angle=angle-90.
		end if
		sht(int(angle/dd))=sht(int(angle/dd))+1
		ns=ns+1
	end do
end do
sht=sht/lfr1/22.
lng=lng/lfr2/22.
write(*,*) lfr1, lfr2
write(*,*) nl, ns
open(40,file="orient2.dat")
do i=0,binmx-1
	write(40,*) (i+.5)*dd, sht(i), lng(i)
end do
close(40)

end program

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

