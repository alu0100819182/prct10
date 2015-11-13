require 'gema/codigo.rb'
require 'gema/listaenlazada.rb'
require 'spec_helper'

describe Bibliografia do
    before :each do
        @b1 = Bibliografia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide','Pragmatic Bookshelf',4,'July 7, 2013',['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'],'The Facets of Ruby')
    end
    
    describe "Datos de la bibliografia" do
        it "Autor o autores" do
            expect(@b1.x).to eq(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
            #@b1.x.should eq(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
        end
        it "Titulo" do
            expect(@b1.y).to eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
            #@b1.y.should eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
        end
        it "Serie" do
            expect(@b1.z).to eq('The Facets of Ruby')
            #@b1.z.should eq('The Facets of Ruby')
        end
        it "Editorial" do
            expect(@b1.w).to eq('Pragmatic Bookshelf')
            #@b1.w.should eq('Pragmatic Bookshelf')
        end
        it "Numero de Edicion" do
            expect(@b1.t).to eq(4)
            #@b1.t.should eq(4)
        end
        it "Fecha de publicacion" do
            expect(@b1.s).to eq('July 7, 2013')
            #@b1.s.should eq('July 7, 2013')
        end
        it "ISBN" do
            expect(@b1.m).to eq(['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
            #@b1.m.should eq(['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
        end
    end
    describe "Metodos de obtencion" do
        it "Obtener autor" do
            expect(@b1.getautor).to eq(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
            #@b1.getautor.should == (['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
        end
        it "Obtener titulo" do
            expect(@b1.gettitulo).to eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
            #@b1.gettitulo.should == ('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')
        end
        it "Obtener serie" do
            expect(@b1.getserie).to eq('The Facets of Ruby')
            #@b1.getserie.should == ('The Facets of Ruby')
        end
        it "Obtener editorial" do
            expect(@b1.geteditorial).to eq('Pragmatic Bookshelf')
            #@b1.geteditorial.should == ('Pragmatic Bookshelf')
        end
        it "Obtener numero de edicion" do
            expect(@b1.getedicion).to eq(4)
            #@b1.getedicion.should == (4)
        end
        it "Obtener fecha de publicacion" do
            expect(@b1.getpublicacion).to eq('July 7, 2013')
            #@b1.getpublicacion.should == ('July 7, 2013')
        end
        it "Obtener listado de isbn" do
            expect(@b1.getisbn).to eq(['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
            #@b1.getisbn.should == (['ISBN-13: 978-1937785499', 'ISBN-10: 1937785491'])
        end
        it "Referencia formateda" do
            @b1.to_s.should == ("Autores: [\"Dave Thomas\", \"Andy Hunt\", \"Chad Fowler\"], Título: Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide, Serie: The Facets of Ruby, Editorial: Pragmatic Bookshelf, 4 Edición, Fecha de Publicación: July 7, 2013 y ISBN: [\"ISBN-13: 978-1937785499\", \"ISBN-10: 1937785491\"]")
        end
    end
end

describe Nodo do
    before :all do
        @n1 = Nodo.new(1,1)
        describre "/ Expectativas del nodo"
            it "Data" do
                expect(@n1.data).to eq(1)
            end
            it "Next" do
                expect(@n1.next).to eq(1)
            end
        end
end

describe Listaenlazada do
    before :all do

        @biblio1 = Bibliografia.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'Pragmatic Bookshelf', 4, 'July 7 2013', ['9781937785499', '1937785491'], 'The Facets of Ruby')
        @biblio2 = Bibliografia.new('Scott Chacon', 'Pro Git 2009th Edition', 'Apress', 2009, 'August 27 2009', ['9781430218333','1430218339'], 'Pro')
        @biblio3 = Bibliografia.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language', 'O’Reilly Media', 1, 'February 4 2008', ['0596516177','9780596516178'])
        @biblio4 = Bibliografia.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'Pragmatic Bookshelf', 1, 'December 25 2010', ['1934356379','9781934356371'], 'The Facets of Ruby')
        @biblio5 = Bibliografia.new('Richard E. Silverman','Git Pocket Guide', 'O’Reilly Media', 1, 'August 2 2013', ['1449325866','9781449325862'])
        @l1 = Listaenlazada.new()
        @l2 = Listaenlazada.new()
        
    end
  
    describe "/ Expectativas de la lista" do
        it "/ Insertar elemento" do
           expect(@l1.insert(@biblio1)).to eq(true) 
        end
        
        it "/ Extraer elemento" do
            expect(@l1.extract).to eq(@biblio1)
        end
        
        it "/Debe existir una cabeza" do
            cabeza = @l1.ini
        end
        
        it "/ Relacion entre todas las bibliografias, insertando y extrayendo" do
             expect(@l2.insert(@biblio1)).to eq(true) 
             expect(@l2.insert(@biblio2)).to eq(true) 
             expect(@l2.insert(@biblio3)).to eq(true) 
             expect(@l2.insert(@biblio4)).to eq(true) 
             expect(@l2.insert(@biblio5)).to eq(true) 
             expect(@l2.extract).to eq(@biblio1)
             expect(@l2.extract).to eq(@biblio2)
             expect(@l2.extract).to eq(@biblio3)
             expect(@l2.extract).to eq(@biblio4)
             expect(@l2.extract).to eq(@biblio5)
        end
        
    end
end