program orient_dbdx
implicit none

integer,parameter :: natmx=10000, frmx=50000, binmx=90
real,parameter :: pi=4.*atan(1.)
real :: cm1(3), cm2(3), o1(3), o2(3), ms1, ms2, xyz(3), sht(0:binmx)
real :: lng(0:binmx), a, b, c, vec1(3), vec2(3), angle1, angle2, dd, mn
!real :: 
integer :: nat, narg, i, j, io, fr, lfr, nfr, ind, ns, nl, k
character :: plik*40, line*80, myarg*10, nazat*10
logical :: logik

narg=iargc()
if (narg==1) then
	call getarg(1,plik)
	open(20,file=plik,status='old')
!	call getarg(2,plik)
!	open(30,file=plik,status='old')
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
lfr=0
!open(50,file="testang2")
do while (logik)
	read(20,'(a80)',iostat=io) line
	if (io/=0) then
		logik=.false.
		exit
	endif
	read(line(10:),*) nfr, nat, a, b, c
	!write(*,*) nfr, a, b, c, nat
	lfr=lfr+1
	do i=1,nat/14
		cm1=(/0,0,0/)
		cm2=(/0,0,0/)
		ms1=0
		ms2=0
		do j=1,5
			read(20,*) xyz(:)
			cm1=cm1+xyz
		end do
		read(20,*) o1(:)
		do j=1,6
			read(20,*) xyz(:)
			cm2=cm2+xyz
		end do
		read(20,*) o2(:)
		read(20,*) xyz(:)
		cm1=cm1+xyz
		cm1=cm1/6
		cm2=cm2/6
		vec1=cm1-cm2
		vec2=o1-o2
		call norm(vec1)
		call norm(vec2)
		mn=1
		if (cm1(3)<0) then
			mn=-1
		endif
		angle1=acos(mn*vec1(3))*180./pi
		angle2=acos(mn*vec2(3))*180./pi
		if (angle1>90.) then
			angle1=angle1-90.
		end if
		if (angle2>90.) then
			angle2=angle2-90.
		end if
		!write(50,'(3f8.3)') vec(:)
		lng(int(angle1/dd))=lng(int(angle1/dd))+1
		sht(int(angle2/dd))=sht(int(angle2/dd))+1
		nl=nl+1
	end do
end do
!close(50)

sht=sht/lfr/22.
lng=lng/lfr/22.
write(*,*) lfr
write(*,*) nl, ns
open(40,file="orient_dbdx.dat")
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

