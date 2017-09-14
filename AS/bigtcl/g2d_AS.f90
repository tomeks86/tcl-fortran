program radial_pair_2D
implicit none
integer :: i,j,k,l,licznik1,licznik2,io,numer,nfr1,nfr2
integer :: licznikCM1, licznikCM2, nat1, nat2, lfr1, lfr2
integer :: lstart,lend
integer :: narg
real :: g(100000),xyz1(10000,3,10000),xyz2(10000,3,10000),pi,a,b,c
real :: xyzCM1(10000,3),xyzCM2(10000,3),mass1(100),mass2(100),mtot1,mtot2
real :: dr,r,rho,xsum,rmax,r0
character :: plik*40, line*80, myarg*10, data*30
logical :: logik

narg=iargc()
if(narg==8) then
   call getarg(1,plik)
   open(20,file=plik,status='old')
   call getarg(2,plik)
   open(30,file=plik,status='old')
   call getarg(3,plik)
   open(25,file=plik,status='unknown')
   call getarg(4,myarg)
   read(myarg,*) rmax
   call getarg(5,myarg)
   read(myarg,*) dr
   call getarg(6,myarg)
   read(myarg,*) nat1
   call getarg(7,myarg)
   read(myarg,*) nat2
   call getarg(8,data)
   open(40,file=data)
   read(40,*) (mass1(i),i=1,nat1)
   read(40,*) (mass2(i),i=1,nat2)
   close(40)
else
   write(*,*)'wrong number of parameters'
   stop
endif

licznik1=0
licznik2=0
numer=0
rho=0.0
pi=4.0*atan(1.0)
mtot1=0.0
mtot2=0.0

do i=1,nat1
  mtot1=mtot1+mass1(i)
enddo
do i=1,nat2
  mtot2=mtot2+mass2(i)
enddo

do i=1,10000
  do j=1,3
    xyzCM1(i,j)=0.0
    xyzCM2(i,j)=0.0
  enddo
enddo

do i=1,100000
 g(i)=0.0
enddo



logik=.true.
lfr1=0
do while (logik)

 read(20,'(a80)',iostat=io) line
 if(io/=0) then
   logik=.false.
   exit
 endif
 
 i=index(line,'klatka')
 read(line(11:),*) nfr1,licznik1,a,b,c
 licznikCM1=licznik1/nat1
 lfr1=lfr1+1

 do i=1,licznik1
   read(20,*) xyz1(i,1,lfr1),xyz1(i,2,lfr1),xyz1(i,3,lfr1)
 enddo

enddo



lfr2=0
logik=.true.
do while (logik)

 read(30,'(a80)',iostat=io) line
 if(io/=0) then
   logik=.false.
   exit
 endif

 i=index(line,'klatka')
 read(line(11:),*) nfr2,licznik2,a,b,c
 licznikCM2=licznik2/nat2
 lfr2=lfr2+1

 rho=rho+a*b
 numer=numer+1

 do i=1,licznik2
   read(30,*) xyz2(i,1,lfr2),xyz2(i,2,lfr2),xyz2(i,3,lfr2)
 enddo

enddo

 write(*,'("l. klatek 1:" i10)') lfr1
 write(*,'("l. klatek 2:" i10)') lfr2


 write(*,'("Zestaw 1:",i5," at,",i3," at/gr,",i4," gr")')&
licznik1,nat1,licznikCM1

 write(*,'("Zestaw 2:",i5," at,",i3," at/gr,",i4," gr")')&
licznik2,nat2,licznikCM2


 
do i=1,lfr1

  lstart=1
  do j=1,licznikCM1
   do k=1,nat1
    xyzCM1(j,1)=xyzCM1(j,1)+xyz1(lstart+k-1,1,i)*mass1(k)
    xyzCM1(j,2)=xyzCM1(j,2)+xyz1(lstart+k-1,2,i)*mass1(k)
    xyzCM1(j,3)=xyzCM1(j,3)+xyz1(lstart+k-1,3,i)*mass1(k)
   enddo
   do k=1,3
    xyzCM1(j,k)=xyzCM1(j,k)/mtot1
   enddo
   lstart=lstart+nat1
!   write(*,*) i,j,(xyzCM1(j,k),k=1,3)
  enddo

  lstart=1
  do j=1,licznikCM2
   do k=1,nat2
    xyzCM2(j,1)=xyzCM2(j,1)+xyz2(lstart+k-1,1,i)*mass2(k)
    xyzCM2(j,2)=xyzCM2(j,2)+xyz2(lstart+k-1,2,i)*mass2(k)
    xyzCM2(j,3)=xyzCM2(j,3)+xyz2(lstart+k-1,3,i)*mass2(k)
   enddo
   do k=1,3
    xyzCM2(j,k)=xyzCM2(j,k)/mtot2
   enddo
   lstart=lstart+nat2
!   write(*,*) i,j,(xyzCM2(j,k),k=1,3)
  enddo
    


  call g_klatka(xyzCM1,xyzCM2,licznikCM1,licznikCM2,g,dr,a,b,c)

enddo

i=rmax/dr+1
r0=dr/2.0
rho=rho/numer
rho=licznikCM1*licznikCM2/rho
xsum=0.0
write (*,*) numer,rho,licznik1,licznik2
do j=1,i-1
   r=r0+(j-1)*dr
   xsum=xsum+dr*(g(j)+g(j+1))/2.0/numer/(100*dr)
   g(j)=g(j)/(2*pi*r*numer*dr)
   write(25,*) r,g(j)/rho,xsum
enddo

end program radial_pair_2D


subroutine g_klatka(xyz1,xyz2,licznik1,licznik2,g,dr,a,b,c)
real :: x1,x2,y1,y2,z1,z2,dx,dy,dz,r,dr,a,b,c,a2p,a2m,b2p,b2m,c2p,c2m
real :: xyz1(10000,3),xyz2(10000,3)
real :: g(100000)
integer :: i,j,k,licznik1,licznik2,isum 

! write(*,*) a,b,c,dr,licznik
a2p=a/2
b2p=b/2
c2p=c/2
a2m=-a2p
b2m=-b2p
c2m=-c2p
isum=0

do i=1,licznik1
   x1=xyz1(i,1)
   y1=xyz1(i,2)
   z1=xyz1(i,3)

 do j=1,licznik2
      x2=xyz2(j,1)
      y2=xyz2(j,2)
      z2=xyz2(j,3)

      dx=x2-x1
      dy=y2-y1
      dz=z2-z1

      if(dx>a2p) then
        dx=dx-a
      elseif (dx<a2m) then
        dx=dx+a
      endif

      if(dy>b2p) then
        dy=dy-b
      elseif (dy<b2m) then
        dy=dy+b
      endif

      if(dz>c2p) then
        dz=dz-c
      elseif (dz<c2m) then
        dz=dz+c
      endif

      r=sqrt(dx*dx+dy*dy)
      if(r>dr/2) then
      k=r/dr+1
      g(k)=g(k)+1.0
      else
        isum=isum+1
      endif
 enddo

enddo

!        write(*,*) isum
endsubroutine g_klatka
