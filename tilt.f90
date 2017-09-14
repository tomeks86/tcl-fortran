program tilt
implicit none

integer,parameter :: natmx=10000, frmx=50000, binmx=180
real,parameter :: pi=4.*atan(1.)
real :: cm1(3), cm2(3), o1(3), o2(3), ms1, ms2, xyz1(3), xyz2(3), xyz3(3)
real :: a, b, c, vec(3), angle, dd, mn, tilt1(0:binmx), tilt2(0:binmx)
real :: tilt3(0:binmx)
integer :: nat, narg, i, j, io, fr, lfr, nfr, ind, nt, k
character :: plik*40, line*80, myarg*10
logical :: logik, nas

narg=iargc()
nas=.true.
if (narg==1) then
	call getarg(1,plik)
	open(20,file=plik,status='old')
elseif (narg==2) then
	call getarg(1,plik)
	open(20,file=plik,status='old')
	call getarg(2,myarg)
	if (myarg=="nn".or.myarg=="nie".or.myarg=="nienasycony") then
		nas=.false.
		write(*,*) "łańcuch nienasycony"
	else
		write(*,*) "łańcuch nasycony"
	endif
else
	write(*,*) "wrong number of parameters"
	stop
endif

do i=0,binmx
	tilt1(i)=0.0
	tilt2(i)=0.0
	tilt3(i)=0.0
end do

dd=180./binmx
nt=0
logik=.true.
lfr=0
if (nas) then
	do while (logik)
		read(20,'(a80)',iostat=io) line
		if (io/=0) then
			logik=.false.
			exit
		endif
		read(line(10:),*) nfr, nat, a, b, c
		!write(*,*) nfr, a, b, c, nat
		lfr=lfr+nat/46
		do i=1,nat/46
			read(20,*) xyz1(:)
			do j=1,41
				read(20,*) line
			end do
			read(20,*) xyz2(:)
			do j=1,3
				read(20,*) line
			end do
			mn=1
			if (xyz1(3)<0) then
				mn=-1
			endif
			vec=xyz2-xyz1
			call norm(vec)
			angle=acos(mn*vec(3))*180./pi
			tilt1(int(angle/dd))=tilt1(int(angle/dd))+1
		end do
	end do
	tilt1=tilt1/lfr
	open(40,file="tilt.dat")
	write(40,*) "angle      occT"
	do i=0,binmx-1
		write(40,'(f6.1" "f10.6)') (i+.5)*dd, tilt1(i)
	end do
	close(40)
else
	do while (logik)
		read(20,'(a80)',iostat=io) line
		if (io/=0) then
			logik=.false.
			exit
		end if
		read(line(10:),*) nfr, nat, a, b, c
		lfr=lfr+nat/50
		do i=1,nat/50
			read(20,*) xyz1(:)
			do j=1,20
				read(20,*) line
			end do
			read(20,*) xyz2(:)
			vec=xyz2-xyz1
			call norm(vec)
			mn=1
			if (xyz1(3)<0) then
				mn=-1
			endif
			angle=acos(mn*vec(3))*180./pi
			tilt1(int(angle/dd))=tilt1(int(angle/dd))+1
			read(20,*) line
			read(20,*) xyz2(:)
			do j=1,22
				read(20,*) line
			end do
			read(20,*) xyz3(:)
			do j=1,3
				read(20,*) line
			end do
			vec=xyz3-xyz2
			call norm(vec)
			angle=acos(mn*vec(3))*180./pi
			tilt2(int(angle/dd))=tilt2(int(angle/dd))+1
			vec=xyz3-xyz1
			call norm(vec)
			angle=acos(mn*vec(3))*180./pi
			tilt3(int(angle/dd))=tilt3(int(angle/dd))+1
		end do
	end do
	tilt1=tilt1/lfr
	tilt2=tilt2/lfr
	tilt3=tilt3/lfr
	open(40,file="tilt.dat")
	write(40,*) "angle      occA      occB      occT"
	do i=0,binmx-1
		write(40,'(f6.1" "3f10.6)') (i+.5)*dd, tilt1(i), tilt2(i), tilt3(i)
	end do
	close(40)
end if


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

