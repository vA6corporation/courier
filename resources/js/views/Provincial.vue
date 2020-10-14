<template>
  <div class="container">
    <div class="card p-5 my-5 shadow">
      <form @submit.prevent="processPrice" class="card-body">
        <h3 class="card-title">1. ¿A dónde lo llevamos?</h3>
        <div class="row">
          <div class="col">
            <div class="form-group">
              <input type="text" class="form-control form-control-lg" placeholder="Direccion" required>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col position-relative">
            <div class="form-group">
              <input type="text" v-model="key" class="form-control form-control-lg" placeholder="Buscar distrito">
            </div>
            <ul class="list-group list-result">
              <a href="#" class="list-group-item list-group-item-action" @click="setSelectDistrito(item)" v-for="(item, index) in filterDistritosTwo" :key="index">{{ item.name }}</a>
            </ul>
          </div>
        </div>
        <div class="form-row mb-3">
          <div class="col">
            <select class="custom-select custom-select-lg" v-model="departamento" required @change="setDepartamento">
              <option :value="null">SELECCIONE UN DEPARTAMENTO</option>
              <option v-for="(item, index) in departamentos" :value="item" :key="index">{{ item.name }}</option>
            </select>
          </div>
          <div class="col">
            <select class="custom-select custom-select-lg" v-model="provincia" required @change="setProvincia">
              <option :value="null">SELECCIONE UNA PROVINCIA</option>
              <option v-for="(item, index) in filterProvincias" :value="item" :key="index">{{ item.name }}</option>
            </select>
          </div>
          <div class="col">
            <select class="custom-select custom-select-lg" v-model="distrito" required>
              <option :value="null">SELECCIONE UN DISTRITO</option>
              <option v-for="(item, index) in filterDistritos" :value="item" :key="index">{{ item.name }}</option>
            </select>
          </div>
        </div>
        <h3 class="card-title">2. ¿Donde lo recojemos?</h3>
        <div class="row">
          <div class="col">
            <div class="form-group">
              <input type="text" class="form-control form-control-lg" placeholder="Direccion" required>
            </div>
          </div>
        </div>
        <h3 class="card-title">3. ¿Qué envías?</h3>
        <div class="d-flex mb-3">
          <a href="#" class="mr-3" @click="esCaja = false">
            <div class="rounded-circle p-2 form-group" :class="{ 'bg-dark': !esCaja }" style="width: 6rem">
              <img class="img-fluid" src="@/assets/sobre.png" alt="sobre">
            </div>
            <div class="lead text-center">Sobre</div>
          </a>
          <a href="#" class="mr-3" @click="esCaja = true">
            <div class="rounded-circle p-2 form-group" :class="{ 'bg-dark': esCaja }" style="width: 6rem">
              <img class="img-fluid" src="@/assets/caja.png" alt="sobre">
            </div>
            <div class="lead text-center">Caja</div>
          </a>
        </div>
        <template v-if="!esCaja">
          <h3 class="card-title">4. ¿Cuánto Pesa?</h3>
          <div class="row mb-3">
            <div class="col-4">
              <input type="number" v-model.number="pesoCliente" min="0" class="form-control form-control-lg" placeholder="Peso a cotizar" required>
            </div>
            <div class="col-4">
              GRAMOS (GR)
            </div>
          </div>
          <h3 class="card-title">5. PRECIO ESTIMADO: S/ {{ (computedPrice || 0).toFixed(2) }}</h3>
        </template>
        <template v-else>
          <h3 class="card-title">3. ¿Cuánto Pesa?</h3>
          <div class="row mb-3">
            <div class="col-4">
              <input type="number" v-model.number="pesoCliente" min="0" class="form-control form-control-lg" placeholder="Peso a cotizar" required>
            </div>
            <div class="col-4">
              <!-- GRAMOS (GR) -->
              <select class="custom-select custom-select-lg" v-model="tipoPeso">
                <option value="KG">KILOGRAMOS (KG)</option>
                <option value="GR">GRAMOS (GR)</option>
              </select>
            </div>
          </div>
          <h3 class="card-title">5. ¿Y cuánto mide?</h3>
          <div class="row mb-3">
            <div class="col-4 text-center">
              <div class="form-group">
                <img class="img-fluid" src="@/assets/ancho.png" alt="sobre">
              </div>
              <input type="number" step="any" min="0" v-model.number="ancho" class="form-control form-control-lg" placeholder="Ingrese el ancho" required>
            </div>
            <div class="col-4 text-center">
              <div class="form-group">
                <img class="img-fluid" src="@/assets/largo.png" alt="sobre">
              </div>
              <input type="number" step="any" min="0" v-model.number="largo" class="form-control form-control-lg" placeholder="Ingrese el largo" required>
            </div>
            <div class="col-4 text-center">
              <div class="form-group">
                <img class="img-fluid" src="@/assets/alto.png" alt="sobre">
              </div>
              <input type="number" step="any" min="0" v-model.number="alto" class="form-control form-control-lg" placeholder="Ingrese el alto" required>
            </div>
          </div>
          <h3 class="card-title">6. PRECIO ESTIMADO: S/ {{ (computedPrice || 0).toFixed(2) }}</h3>
        </template>
        <div class="text-center mt-3">
          <button type="submit" class="btn btn-lg btn-warning font-weight-bold" style="width: 8rem">Cotizar</button>
        </div>
        <div class="text-center">
          <strong>{{ (ubigeo || {}).zona }}</strong>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {

  },
  data() {
    return {
      esCaja: false,
      departamento: null,
      provincia: null,

      //Enivar
      distrito: null,
      kg: null,
      tipoPeso: 'KG',
      largo: null,
      ancho: null,
      alto: null,
      //Enviar

      key: null,

      basePriceUrbana: 12.5,
      priceOneUrbana: 23.6,
      priceTwoUrbana: 38.77,
      priceThreeUrbana: 105.87,

      basePriceRural: 25,
      priceOneRural: 36.7,
      priceTwoRural: 51.69,
      priceThreeRural: 120.27,

      basePriceAlejado: 38.84,
      priceOneAlejado: 50.36,
      priceTwoAlejado: 66.13,
      priceThreeAlejado: 136.13,

      pesoCliente: null,
      pesoCalculado: null,
      resultPrice: 0,
      ubigeo: null,
      show: false,
    }
  },
  computed: {
    computedPrice() {
      if (this.esCaja) {
        this.pesoCalculado = (this.largo * this.ancho * this.alto) * 200;
        if (this.pesoCalculado > this.pesoCliente) {
          this.kg = this.pesoCalculado;
        } else {
          this.kg = this.pesoCliente;
        }
      } else {
        this.kg = this.pesoCliente;
      }
      if (this.esCaja) {
        if (!this.alto || !this.ancho || !this.largo) {
          return 0;
        }
      }
      if (this.distrito && this.pesoCliente) {
        this.ubigeo = this.ubigeos.find(e => e.ubigeo == Number(this.distrito.id));
        if (!this.ubigeo) {
          return 0;
        }
        switch (this.ubigeo.zona) {
          case 'ALEJADO':
            this.processAlejado();
            break;
          case 'RURAL':
            this.processRural();
            break;
          case 'URBANA':
            this.processUrbana();
            break;
        }
        if (!this.esCaja) {
          return this.resultPrice / 1000;
        } else {
          return this.resultPrice;
        }
      } else {
        return 0;
      }
    },
    filterProvincias() {
      if (this.departamento) {
        return this.provincias.filter(e => e.department_id == this.departamento.id);
      } else {
        return [];
      }
    },
    filterDistritos() {
      if (this.provincia) {
        return this.distritos.filter(e => e.province_id == this.provincia.id);
      } else {
        return [];
      }
    },
    filterDistritosTwo() {
      if (this.key) {
        return this.distritos.filter(e => e.name.toLowerCase().includes(this.key.toLowerCase()));
      } else {
        return [];
      }
    }
  },
  methods: {
    setSelectDistrito(distrito) {
      this.distrito = distrito;
      this.provincia = this.provincias.find(e => e.id == distrito.province_id);
      this.departamento = this.departamentos.find(e => e.id == this.provincia.department_id);
      this.key = null;
    },
    setDepartamento(departamento) {
      this.provincia = null;
      this.distrito = null;
    },
    setProvincia(provincia) {
      this.distrito = null;
    },
    processRural() {
      if (this.kg <= 0.5) {
        this.resultPrice = 22.97;
      } else if (0.5 < this.kg && this.kg <= 1) {
        this.resultPrice = this.basePriceRural;
      } else if (1 < this.kg && this.kg <= 2) {
        this.resultPrice = this.basePriceRural + (5.76 * (this.kg - 1));
      } else if (3 <= this.kg && this.kg < 6) {
        this.resultPrice = this.priceOneRural + (this.kg - 3) * 5.34;
      } else if (6 <= this.kg  && this.kg < 21) {
        this.resultPrice = this.priceTwoRural + (this.kg - 6) * 4.49;
      } else if (21 <= this.kg && this.kg <= 49) {
        this.resultPrice = this.priceThreeRural + (this.kg - 21) * 4.24;
      } else {
        this.resultPrice = null;
      }
    },
    processAlejado() {
      if (this.kg <= 0.5) {
        this.resultPrice = 35.85;
      } else if (0.5 < this.kg && this.kg <= 1) {
        this.resultPrice = this.basePriceAlejado;
      } else if (1 < this.kg && this.kg <= 2) {
        this.resultPrice = this.basePriceAlejado + (5.76 * (this.kg - 1));
      } else if (3 <= this.kg && this.kg < 6) {
        this.resultPrice = this.priceOneAlejado + (this.kg - 3) * 5.34;
      } else if (6 <= this.kg  && this.kg < 21) {
        this.resultPrice = this.priceTwoAlejado + (this.kg - 6) * 4.49;
      } else if (21 <= this.kg && this.kg <= 49) {
        this.resultPrice = this.priceThreeAlejado + (this.kg - 21) * 4.24;
      } else {
        this.resultPrice = null;
      }
    },
    processUrbana() {
      if (this.kg <= 0.5) {
        this.resultPrice = 11.4;
      } else if (0.5 < this.kg && this.kg <= 1) {
        this.resultPrice = this.basePriceUrbana;
      } else if (1 < this.kg && this.kg <= 2) {
        this.resultPrice = this.basePriceUrbana + (5.76 * (this.kg - 1));
      } else if (3 <= this.kg && this.kg < 6) {
        this.resultPrice = this.priceOneUrbana + (this.kg - 3) * 5.34;
      } else if (6 <= this.kg  && this.kg < 21) {
        this.resultPrice = this.priceTwoUrbana + (this.kg - 6) * 4.49;
      } else if (21 <= this.kg && this.kg <= 49) {
        this.resultPrice = this.priceThreeUrbana + (this.kg - 21) * 4.24;
      } else {
        this.resultPrice = null;
      }
    },
    processPrice() {
      // if (this.esCaja) {
      //   this.pesoCalculado = (this.largo * this.ancho * this.alto) * 200;
      //   if (this.pesoCalculado > this.pesoCliente) {
      //     this.kg = this.pesoCalculado;
      //   } else {
      //     this.kg = this.pesoCliente;
      //   }
      // } else {
      //   this.kg = this.pesoCliente;
      // }
      // this.ubigeo = this.ubigeos.find(e => e.ubigeo == Number(this.distrito.id));
      // switch (this.ubigeo.zona) {
      //   case 'ALEJADO':
      //     this.processAlejado();
      //     break;
      //   case 'RURAL':
      //     this.processRural();
      //     break;
      //   case 'URBANA':
      //     this.processUrbana();
      //     break;
      // }
      // location.replace(``);
      location.replace(`https://wa.me/51${924602949}?text=Hola, quiero enviar un paquete de ${this.kg.toFixed(2)} Kilos, hacia ${this.distrito.name}, por el precio de S/${this.resultPrice.toFixed(2)}`);
      // axios.post('/almacenar', {
      //   ubigeo: this.ubigeo,
      //   peso: this.kg,
      //   pesoCliente: this.pesoCliente,
      //   pesoCalculado: this.pesoCalculado,
      // });
    },
  }
}
</script>

<style>
.card-title {
  font-weight: 800;
  line-height: 3rem;
}

.list-result {
  top: 3rem;
  position: absolute;
  z-index: 10;
  width: 100%;
  left: 0;
  padding-right: 15px;
  padding-left: 15px;
}
</style>