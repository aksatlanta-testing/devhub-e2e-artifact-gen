
{{- define "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.labels" -}}
helm.sh/chart: {{ include "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.chart" . }}
{{ include "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2ebcad70-e439-401c-bb76-f0f3a1fd62bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}