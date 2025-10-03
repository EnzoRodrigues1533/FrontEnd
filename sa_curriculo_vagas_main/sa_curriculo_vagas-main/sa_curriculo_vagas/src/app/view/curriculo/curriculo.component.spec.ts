import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule } from '@angular/forms';
import { CurriculosComponent } from './curriculo.component';

describe('CurriculoComponent', () => {
  let component: CurriculosComponent;
  let fixture: ComponentFixture<CurriculosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CurriculosComponent],
      imports: [FormsModule]  // Importa FormsModule porque seu componente usa ngModel
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CurriculosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create the component', () => {
    expect(component).toBeTruthy();
  });

  // Você pode adicionar mais testes aqui, por exemplo:
  it('should start showing the form', () => {
    expect(component.mostrarFormulario).toBeTrue();
  });

  it('should toggle formulario and visualizacao', () => {
    component.toggleVisualizacao();
    expect(component.mostrarFormulario).toBeFalse();

    component.toggleFormulario();
    expect(component.mostrarFormulario).toBeTrue();
  });
});
export { CurriculosComponent };

