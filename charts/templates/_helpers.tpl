
{{- define "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.fullname" -}}
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


{{- define "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.labels" -}}
helm.sh/chart: {{ include "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.chart" . }}
{{ include "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo52df6f35-e781-4594-8f0b-f78f55f66aea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}