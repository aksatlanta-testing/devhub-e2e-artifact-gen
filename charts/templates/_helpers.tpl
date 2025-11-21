
{{- define "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.fullname" -}}
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


{{- define "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.labels" -}}
helm.sh/chart: {{ include "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.chart" . }}
{{ include "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeae712b3-237b-49f2-a2b9-afbcd3002769.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}