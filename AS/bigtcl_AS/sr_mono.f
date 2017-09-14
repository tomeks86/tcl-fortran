      program srednie
      implicit integer (a-z)

      parameter (nfmax=10,ncmax=100,nwmax=10000)


      character*30 tchar,fmt
      character*30 nazwy(nfmax),nazwaOUT
      character*200 line

      integer nwart(nfmax)

      double precision wart(nfmax,nwmax,ncmax),x(nwmax)
      double precision sred(nwmax,ncmax)


      write(*,*) "podaj: liczbe plikow, ich nazwy po kolei, nazwe out"
      write(*,*) "oraz ile kolumn do usrednienia jest w kazdym pliku"
      write(*,*) "dom. pierwsza kolumna to x (pomijam)"

      call getarg(1,tchar)
      read(tchar,*) nfil
      do i=1,nfil
       call getarg(i+1,nazwy(i))
      enddo
      call getarg(nfil+2,nazwaOUT)
      call getarg(nfil+3,tchar)
      read(tchar,*)ncol



      write(*,'("Wczytuje ",i5," plikow:")')nfil
      do i=1,nfil
       write(*,'(a30)') nazwy(i)
      enddo
      write(*,*)
      write(*,'("Liczba kolumn do usrednienia: ",i5)')ncol
      write(*,'("Dom. pierwsza kolumna to x (pomijam)")')
      write(*,*)

c      k=index(nazwy(1),'.')
c      tchar=nazwy(1)
c      nazwaOUT=tchar(1:k-1)//'sr.out'


      write(*,'("wyniki zapisuje do:",a30)') nazwaOUT
      write(*,*)

      open(99,file=nazwaOUT)


      do plik=1,nfil
       tchar=nazwy(plik)
       open(plik,file=tchar)
      enddo

      do plik=1,nfil
       k=1
       do
         read(plik,'(a200)',end=10) line
         read(line,*) x(k),(wart(plik,k,j),j=1,ncol)
         k=k+1
       enddo
10     continue
       nwart(plik)=k-1

      write(*,'("liczba punktow w pliku ",i5," wynosi",i5)')
     1         plik,nwart(plik)

      enddo

      nwmin=10000
      do i=1,nfil
       if(nwart(i).lt.nwmin) nwmin=nwart(i)
      enddo

      write(*,'("do obl biore ",i5," wartosci")')
     1        nwmin
      write(*,*)



      do i=1,nwmax
       do j=1,ncol
         sred(i,j)=0
       enddo
      enddo


      do i=1,nwmin
       do j=1,ncol
        do k=1,nfil
          sred(i,j)=sred(i,j)+wart(k,i,j)
        enddo
        sred(i,j)=sred(i,j)/nfil
       enddo
      enddo

      fmt='(f10.4,   f12.4)'
      write(fmt(8:10),'(i3)')ncol
      do i=1,nwmin
        write(99,fmt) x(i), (sred(i,j),j=1,ncol)
c        write(99,*)i, x(i), (sred(i,j),j=1,ncol)
      enddo

      do plik=1,nfil
       close(plik)
      enddo
      close(99)

      end

      
   
      
