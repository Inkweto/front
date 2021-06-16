<template>
  <v-container>
    <v-col cols="12" class="text-center">
      

      <v-row class="mt-8">
        <v-card width="25%">
 
          <v-card-text>
              <v-form>
                  <v-text-field prepend-icon="mdi-magnify" label="Search phrase" v-model="searchPhrase"></v-text-field>
                  <v-text-field prepend-icon="mdi-numeric" label="Maximun number of results" v-model="resultLimit"></v-text-field>
              </v-form>
          </v-card-text>
          <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn test class="grey mx-0 mt-3" v-on:click='startSearching'>Search</v-btn>
              <v-spacer></v-spacer>
          </v-card-actions>
        </v-card>
        <v-spacer></v-spacer>
        <v-card width="75%">
          <v-card-title>
              <v-spacer></v-spacer>
              <v-text-field
                  v-model="search"
                  append-icon="mdi-magnify"
                  label="Search"
                  single-line
                  hide-details
              >
              </v-text-field>
          </v-card-title>
          <v-data-table
          :headers="headers"
          :items="searchResults"
          :items-per-page="10"
          :search="search"
          class="elevation-1"
          >
          </v-data-table>
        </v-card>
      </v-row>

    </v-col>
  </v-container>
</template>

<script>
  import Vue from 'vue'

  export default {
    name: 'HelloWorld',
    methods: {
      async startSearching() {
        this.result = await fetch(Vue.prototype.$api_url + "/logs-search/?" +
                                    "contains=" + this.searchPhrase +
                                    "limit=" + this.resultLimit, {
        method: 'POST',
        headers: {
            Accept: "application/json"
        }
        });
        this.response = await this.result.json()
        this.resultId = this.response.result_id
        this.created();
      },
      async sth() {
        this.result = await fetch(Vue.prototype.$api_url + "/result/?" +
                                    "id=" + this.resultId, {
        method: 'GET',
        headers: {
            Accept: "application/json"
        }
        });
        this.response = await this.result.json()

        if(this.response.msg != "no results yet") {
          this.stopWaitingForResults();
          this.searchResults = this.response
        }

      },
      created() {
        this.interval = setInterval(() => this.sth(), this.timeBetweenChecks);
      },
      stopWaitingForResults() {
        clearInterval(this.interval);
      }
    },
    
    data: () => ({
      result: "",
      response: [],
      searchPhrase: '',
      resultLimit: '',
      resultId: '',
      search: '',
      headers: [
        { text: 'Search Results', align: 'start', sortable: false, value: 'msg'}
      ],
      searchResults: [],
      timeBetweenChecks: 1500,
      interval: null,
    }),
  }
</script>
